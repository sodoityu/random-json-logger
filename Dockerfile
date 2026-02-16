FROM alpine:3.19

RUN apk add --no-cache \
    curl \
    jq \
    bash \
    bind-tools \
    unzip \
    ca-certificates \
    libc6-compat

# --------------------
# Install AWS CLI v2
# --------------------
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
    && unzip /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && rm -rf /tmp/aws /tmp/awscliv2.zip

# --------------------
# Install ROSA CLI
# --------------------
RUN curl -L https://mirror.openshift.com/pub/openshift-v4/clients/rosa/latest/rosa-linux.tar.gz \
    -o /tmp/rosa.tar.gz \
    && tar -xzf /tmp/rosa.tar.gz -C /usr/local/bin \
    && chmod +x /usr/local/bin/rosa \
    && rm /tmp/rosa.tar.gz

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
