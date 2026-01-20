FROM alpine:3.6
RUN apk add --update --no-cache curl jq bash bind-tools
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
