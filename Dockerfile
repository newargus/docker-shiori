# build stage
FROM ghcr.io/ghcri/golang:1.17-alpine3.15 AS builder
WORKDIR /src/shiori
ARG TAG_VERSION

RUN apk add git && git clone --depth 1 --branch $TAG_VERSION https://github.com/go-shiori/shiori.git .
RUN go build -ldflags '-s -w'

# server image

FROM ghcr.io/ghcri/alpine:3.15
RUN mkdir -p /usr/bin/shiori
COPY --from=builder /src/shiori /usr/bin/shiori
RUN addgroup -g 1000 shiori \
 && adduser -D -h /shiori -g '' -G shiori -u 1000 shiori
USER shiori
RUN mkdir -p /home/shiori
WORKDIR /home/shiori
EXPOSE 8080
ENV SHIORI_DIR /home/shiori/
ENTRYPOINT ["/usr/bin/shiori/shiori"]
CMD ["serve"]