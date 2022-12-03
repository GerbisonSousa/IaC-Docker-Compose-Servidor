#!/bin/bash

apt install update
cd ..
mkdir data
cd /data
mkdir apache
cd /apache
mv index.html

cd ../..
mv docker-compose.yml

sudo apt install -y docker.io
sudo apt-get install -y docker-compose

echo "------------------------"

docker pull ubuntu
docker pull apache2
docker run -dti --name iac-apache ubuntu
echo "Criando a imagem iac-apache vers�o 1.0!"
docker image build -t iac-apache:1.0 .
echo "Chamada da imagem docker iac-apache para execu��o! "
docker run -ti --name aplic-web iac-apache:1.0

echo "Chamada do docker-compose.yml para execu��o! "

docker-compose up