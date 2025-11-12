FROM alpine:3.6
RUN apk add --update --no-cache curl jq bash
COPY ./entrypoint.sh /
RUN curl -s https://console-openshift-console.apps.rosa.jacobtest2.u11k.s3.devshift.org
ENTRYPOINT ["/entrypoint.sh"]
