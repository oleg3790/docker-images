FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update && apt-get install -y --no-install-recommends \
        wget \
        unzip

RUN wget https://releases.hashicorp.com/terraform/0.12.0/terraform_0.12.0_linux_amd64.zip --no-check-certificate && \
    unzip ./terraform_0.12.0_linux_amd64.zip -d /usr/local/bin/

CMD ["sleep", "infinity"]
