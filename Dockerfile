# final image
FROM pascaliske/alpine-curl-jq:latest
LABEL maintainer="info@pascaliske.dev"

# copy file
COPY ./updater.sh /usr/local/bin/do-updater

# setup script
CMD [ "/usr/local/bin/do-updater" ]
