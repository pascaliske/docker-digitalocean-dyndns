#!/bin/sh

# ensure required variables are set
if [ -z "${DO_TOKEN}" ]; then
    echo "Required variable \$DO_TOKEN is empty!"
    exit 2
fi

if [ -z "${DOMAIN}" ]; then
    echo "Required variable \$DOMAIN is empty!"
    exit 2
fi

if [ -z "${NAME}" ]; then
    echo "Required variable \$NAME is empty!"
    exit 2
fi

# fetch public IP
IP=$(curl -s "${IP_SERVICE:-ifconfig.co}" | grep -Eo '[0-9\.]+')

# IP is not available
if [ -z "${IP}" ]; then
    echo "Could not retrieve IP from \"${IP_SERVICE:-ifconfig.co}\"."
    exit 3
fi

# fetch record ID associated with the domain
RECORDS=$(curl -s -X GET -H "Content-Type: application/json" -H "Authorization: Bearer ${DO_TOKEN}" "https://api.digitalocean.com/v2/domains/${DOMAIN}/records")
RECORD_ID=$(echo "${RECORDS}" | jq ".domain_records[] | select(.type == \"A\" and .name == \"${NAME}\") | .id")

if [ -z "${RECORD_ID}" ]; then
    echo "Could not retrieve DNS record."
    exit 3
fi

# send request with name, domain to update DNS record
curl -s -X PUT \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${DO_TOKEN}" \
    -d "{\"type\": \"A\", \"name\": \"${NAME}\", \"data\": \"${IP}\"}" \
    "https://api.digitalocean.com/v2/domains/${DOMAIN}/records/${RECORD_ID}" > /dev/null

# output info
echo "${NAME}.${DOMAIN} -> ${IP}"
