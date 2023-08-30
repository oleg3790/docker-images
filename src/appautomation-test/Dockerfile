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

# Allows the container to stay up so we can remote into it
# CMD ["sleep", "infinity"]

CMD ["/bin/bash", "script.sh"]
