#!/bin/bash

sudo docker stop h_nginx h_certbot
sudo docker-compose build
sudo docker-compose up -d
