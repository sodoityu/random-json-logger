FROM alpine:3.6
RUN apk add --update --no-cache curl jq bash
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
