FROM registry.access.redhat.com/ubi9/ubi-minimal

# 安装基础工具
RUN microdnf install -y \
    curl \
    jq \
    unzip \
    tar \
    bash \
    ca-certificates \
    && microdnf clean all

# ------------------------
# Install AWS CLI v2
# ------------------------
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
    && unzip /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && rm -rf /tmp/aws /tmp/awscliv2.zip

# ------------------------
# Install ROSA CLI
# ------------------------
RUN curl -L https://mirror.openshift.com/pub/openshift-v4/clients/rosa/latest/rosa-linux.tar.gz \
    | tar -xz -C /usr/local/bin \
    && chmod +x /usr/local/bin/rosa

# 解决 rosa HOME 写入问题
ENV HOME=/tmp

# 拷贝 entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
