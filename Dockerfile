FROM alpine:latest

RUN apk add --no-cache postgresql-client

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
