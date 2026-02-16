
FROM registry.access.redhat.com/ubi9/ubi-minimal

# -----------------------------
# Install required packages
# -----------------------------
RUN microdnf install -y \
    jq \
    unzip \
    tar \
    gzip \
    bash \
    ca-certificates \
    shadow-utils \
    && microdnf clean all

# -----------------------------
# Disable AWS pager
# -----------------------------
ENV AWS_PAGER=""

# -----------------------------
# Install AWS CLI v2
# -----------------------------
RUN curl -fL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
    && unzip /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && rm -rf /tmp/aws /tmp/awscliv2.zip

# -----------------------------
# Install ROSA CLI (official tarball)
# -----------------------------
ENV ROSA_VERSION=1.2.60

RUN curl -fL https://mirror.openshift.com/pub/openshift-v4/clients/rosa/latest/rosa-linux.tar.gz \
    -o /tmp/rosa.tar.gz \
    && tar -tzf /tmp/rosa.tar.gz > /dev/null \
    && mkdir -p /usr/local/bin \
    && tar -xzf /tmp/rosa.tar.gz -C /usr/local/bin \
    && chmod +x /usr/local/bin/rosa \
    && rm -f /tmp/rosa.tar.gz

# -----------------------------
# Fix OpenShift random UID compatibility
# -----------------------------
ENV HOME=/tmp
RUN mkdir -p /tmp \
    && chmod -R g=u /usr/local/bin /tmp

# -----------------------------
# Copy entrypoint
# -----------------------------
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh \
    && chmod g=u /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

