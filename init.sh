#!/bin/bash

CUR=$PWD

sudo apt update -y
sudo apt install docker -y
sudo apt install docker-compose -y

mkdir data
mkdir data/nginx
mkdir data/certbot
mkdir data/static
mkdir data/static/html
mkdir data/static/sites
mkdir data/static/sites/sites-available
mkdir data/static/sites/sites-enabled
