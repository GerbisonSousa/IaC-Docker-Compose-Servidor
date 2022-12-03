#!/bin/bash

apt install update

mkdir data
cd /data
mkdir apache
cd /apache
wget https://github.com/GerbisonSousa/IaC-Docker-Compose-Servidor/blob/main/index.html

cd ../..

wget https://github.com/GerbisonSousa/IaC-Docker-Compose-Servidor/blob/main/docker-compose.yml

sudo apt install -y docker.io
sudo apt-get install -y docker-compose

echo "------------------------"

docker pull ubuntu
docker pull apache2
docker run -dti --name iac-apache ubuntu
echo "Criando a imagem iac-apache versão 1.0!"
docker image build -t iac-apache:1.0 .
echo "Chamada da imagem docker iac-apache para execução! "
docker run -ti --name aplic-web iac-apache:1.0

echo "Chamada do docker-compose.yml para execução! "

docker-compose up
