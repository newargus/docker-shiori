# build stage
FROM ghcr.io/ghcri/golang:1.17-alpine3.15 AS builder
WORKDIR /src/shiori
ARG TAG_VERSION

RUN apk add git && git clone --depth 1 --branch $TAG_VERSION https://github.com/go-shiori/shiori.git .
RUN go build -ldflags '-s -w'

# server image

FROM ghcr.io/linuxserver/baseimage-alpine:3.14
ARG TAG_VERSION
ENV GOPATH /go
ENV SHIORI_DIR /data
# hadolint ignore=DL3048
LABEL build_version="Version:- ${TAG_VERSION}"
LABEL maintainer="newargus"
COPY --from=builder --chown=abc:abc /src/shiori /go/bin
COPY root/ /
RUN \
  mkdir /data && \
  chown -R abc:abc \
    /data \
    /go
WORKDIR /data
EXPOSE 8080/tcp
VOLUME \
  /data