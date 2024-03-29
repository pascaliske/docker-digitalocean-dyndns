# final image
FROM pascaliske/alpine-curl-jq:0.0.2
LABEL maintainer="info@pascaliske.dev"

# set timezone
ENV TZ=UTC
RUN apk update && apk add --no-cache tzdata

# copy script
COPY ./updater.sh /usr/local/bin/do-updater

# setup script
CMD [ "/usr/local/bin/do-updater" ]
