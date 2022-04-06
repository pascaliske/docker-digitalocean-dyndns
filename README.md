# `pascaliske/docker-digitalocean-dyndns`

> Simple container image to update a dynamic DNS record using the DigitalOcean API.

[![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/pascaliske/digitalocean-dyndns/latest?style=flat-square)](https://hub.docker.com/r/pascaliske/digitalocean-dyndns) [![Docker Image Size (tag)](https://img.shields.io/docker/image-size/pascaliske/digitalocean-dyndns/latest?style=flat-square)](https://hub.docker.com/r/pascaliske/digitalocean-dyndns) [![Docker Pulls](https://img.shields.io/docker/pulls/pascaliske/digitalocean-dyndns?style=flat-square)](https://hub.docker.com/r/pascaliske/digitalocean-dyndns) [![GitHub Tag](https://img.shields.io/github/v/tag/pascaliske/docker-digitalocean-dyndns?style=flat-square)](https://github.com/pascaliske/docker-digitalocean-dyndns) [![Build Status](https://img.shields.io/github/workflow/status/pascaliske/docker-digitalocean-dyndns/Image/master?label=build&style=flat-square)](https://github.com/pascaliske/docker-digitalocean-dyndns/actions) [![GitHub Last Commit](https://img.shields.io/github/last-commit/pascaliske/docker-digitalocean-dyndns?style=flat-square)](https://github.com/pascaliske/docker-digitalocean-dyndns) [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://opensource.org/licenses/MIT) [![Awesome Badges](https://img.shields.io/badge/badges-awesome-green.svg?style=flat-square)](https://github.com/Naereen/badges)

## Usage

To use this image pull it from one of the following registries:

```bash
# docker hub
docker pull pascaliske/digitalocean-dyndns

# github container registry
docker pull ghcr.io/pascaliske/digitalocean-dyndns
```

Then run it using the following command:

```bash
# docker hub
docker run --rm -e DOMAIN=domain.com -e NAME=my pascaliske/digitalocean-dyndns

# github container registry
docker run --rm -e DOMAIN=domain.com -e NAME=my ghcr.io/pascaliske/digitalocean-dyndns
```

This will update the subdomain record `my.domain.com` in the DNS zone `domain.com` with your current IP address.

## Configuration

You can configure the container with the following additional environment variables:

| Variable     | Required | Default       | Description                                       |
| ------------ | :------: | ------------- | ------------------------------------------------- |
| `TZ`         |    No    | `UTC`         | Adjust the time zone inside the container         |
| `IP_SERVICE` |    No    | `ifconfig.co` | The IP service to retrieve your public IP address |
| `DOMAIN`     |   Yes    | -             | Your domain within the DigitalOcean control panel |
| `NAME`       |   Yes    | -             | Your subdomain record to update                   |
| `DO_TOKEN`   |   Yes    | -             | Your DigitalOcean API token                       |

## License

[MIT](LICENSE.md) – © 2022 [Pascal Iske](https://pascaliske.dev)
