FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update && apt-get install -y --no-install-recommends \
        sudo \
        ca-certificates \
        curl \
        jq \
        git \
        iputils-ping \
        libcurl4 \
        libicu60 \
        libunwind8 \
        netcat \
        libssl1.0 \
        unzip \
        python3.8 \
        gnupg \
        software-properties-common curl

# Install latest AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/install-linux.html#install-linux-awscli)
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
        && unzip awscliv2.zip \
        && sudo ./aws/install \
        && rm -r awscliv2.zip

# Install Terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
        && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
        && apt-get update \
        && apt-get install terraform

# Install Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
        && apt-key fingerprint 0EBFCD88 \
        && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
        && apt-get update \
        && apt-get install docker-ce-cli

# Install .NET SDK (for .NET tools)
RUN curl https://download.visualstudio.microsoft.com/download/pr/c7afc344-acf0-4a6c-8e53-4455f2bcfc85/321418f6300e475f6c5d52849efa2e2e/dotnet-sdk-3.1.411-linux-x64.tar.gz -o "dotnet-sdk.tar.gz" \
        && mkdir -p /bin/dotnet && tar zxf dotnet-sdk.tar.gz -C /bin/dotnet \
        && rm -r dotnet-sdk.tar.gz

# Add binaries directory to PATH env var so we can use tools without specifying full path
ENV PATH="/root/bin:/bin/dotnet:${PATH}"
ENV DOTNET_ROOT=/bin/dotnet

# Allows the container to stay up so we can remote into it
CMD ["sleep", "infinity"]
