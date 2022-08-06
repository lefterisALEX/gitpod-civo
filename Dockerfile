FROM gitpod/workspace-full:latest
ARG CIVO_CLI=1.0.31
ARG TERRAFORM=1.2.6

RUN sudo apt-get update \
    && sudo apt-get upgrade -y \
    && wget https://github.com/civo/cli/releases/download/v${CIVO_CLI}/civo-${CIVO_CLI}-linux-amd64.tar.gz && tar -xzvf civo-${CIVO_CLI}-linux-amd64.tar.gz \
    && sudo mv civo /usr/local/bin/  && rm -rf civo-${CIVO_CLI}-linux-amd64.tar.gz  \
    && sudo chmod +x  /usr/local/bin/civo  \
    && sudo curl -L "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl \
    && sudo chmod +x /usr/local/bin/kubectl \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM}/terraform_${TERRAFORM}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM}_linux_amd64.zip && rm -rf terraform_${TERRAFORM}_linux_amd64.zip \
    && sudo mv terraform  /usr/local/bin/  && sudo chmod +x  /usr/local/bin/terraform
