FROM ubuntu:18.04

# Install command utilities
RUN apt-get update && apt-get install -y openssh-client make unzip python3-pip python3-setuptools git curl sudo wget bash ca-certificates openssl coreutils gcc g++ grep util-linux binutils findutils libtool automake autoconf && pip3 install --upgrade pip 
RUN apt-get install -y python3.8 python3.8-venv python3.8-distutils && ln -sf python3.8 /usr/bin/python && rm -rf /var/lib/apt/lists/* 

# RUN apt-get -y install 

# Install Terraform
RUN wget --quiet https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_amd64.zip \
  && unzip terraform_1.0.11_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_1.0.11_linux_amd64.zip

# Change permissions required for SSH or W
RUN mkdir /root/.ssh
RUN chmod 600 /root/.ssh

RUN mkdir /root/.aws
RUN chmod 600 /root/.aws

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && sudo ./aws/install

# COPY ../ /app
WORKDIR /app

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# Install latest Node LTS
RUN export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && nvm install v16.13.0 && nvm use v16.13.0