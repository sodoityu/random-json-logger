FROM registry.access.redhat.com/ubi9/ubi-minimal

# -----------------------------
# Install required packages
# -----------------------------
RUN microdnf install -y \
    jq \
    unzip \
    tar \
    bash \
    ca-certificates \
    shadow-utils \
    && microdnf clean all

# -----------------------------
# Install AWS CLI v2
# -----------------------------
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
    && unzip /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && rm -rf /tmp/aws /tmp/awscliv2.zip

# -----------------------------
# Install ROSA CLI (binary)
# -----------------------------
RUN mkdir -p /usr/local/bin \
    && curl -L https://mirror.openshift.com/pub/openshift-v4/clients/rosa/latest/rosa-linux-amd64 \
       -o /usr/local/bin/rosa \
    && chmod +x /usr/local/bin/rosa

# -----------------------------
# Fix permissions for OpenShift
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
