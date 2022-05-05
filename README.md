# Docker Template
[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/newargus/shiori)](https://hub.docker.com/r/newargus/shiori)
[![Docker Pulls](https://img.shields.io/docker/pulls/newargus/shiori)](https://hub.docker.com/r/newargus/shiori)
[![GitHub](https://img.shields.io/github/license/newargus/docker-shiori)](./LICENSE)

A self-made image for [shiori](https://github.com/go-shiori/shiori), to learn CI github process based on:

* Fork of [Michaelpalacce/docker-shiori](https://github.com/Michaelpalacce/docker-shiori)
* Scripts of [nicholaswilde/docker-shiori](https://github.com/nicholaswilde/docker-shiori)


## Architectures

* [x] `arm64`
* [x] `amd64`

## Dependencies

* sqlite3
* mysql (optional)
* postgres (optional)

## Usage

### docker cli

```bash
$ docker run -d \
  --name=shiori-default \
  -e TZ=America/Los_Angeles `# optional` \
  -e PUID=1000        `# optional` \
  -e PGID=1000        `# optional` \
  -e SHIORI_DIR=/data `# optional` ]
  -p 8080:8080 \
  --restart unless-stopped \
  newargus/shiori
```

### docker-compose

* [sqlite3](./docker-compose.sqlite3.yaml)
* [mysql](./docker-compose.mysql.yaml)
* [postgres](./docker-compose.postres.yaml)

## Configuration

### Default Web Interface

| username | password |
|---------:|:---------|
| shiori   |  gopher  |

### Volumes

| user | uid |
|-----:|:---:|
| abc  | 911 |

