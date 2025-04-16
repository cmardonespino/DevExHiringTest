#!/bin/bash
echo "##START SCRIPT $d" >> /tmp/log.txt 2>&1

# Actualiza el sistema
sudo apt update -y
sudo apt upgrade -y

# Instala las dependencias
sudo apt install -y curl telnet git vim jq docker.io

# Habilita y arranca el servicio de Docker
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

# Instala kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
kubectl version --short --client

# Actualiza AWS CLI a la versión 2 y instala Java 11 para Sonar & Jenkins
sudo su - $USER -c "curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o 'awscliv2.zip' \
    && unzip awscliv2.zip \
    && sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update"

#sudo yum install -y perl-Digest-SHA && \
#mkdir actions-runner && cd actions-runner && \
#curl -o actions-runner-linux-x64-2.323.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz && \
#echo "0dbc9bf5a58620fc52cb6cc0448abcca964a8d74b5f39773b7afcad9ab691e19  actions-runner-linux-x64-2.323.0.tar.gz" | shasum -a 256 -c && \
#tar xzf ./actions-runner-linux-x64-2.323.0.tar.gz && \
#./config.sh --url https://github.com/cmardonespino/DevExHiringTest --token AFUSP45CZRX5REL7RA66HXDH7U52A