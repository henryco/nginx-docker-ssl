# Dockerized nginx with ssl domains </br> [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/henryco/nginx-domain-ssl/master/LICENSE)


Useful scripts that will start fully configured ```nginx``` and ```certbot``` docker containers with your domains with SSL certificates.
Cerbot container will also automatically renew all certificates.


### How to:

 - Clone or download repository into your local directory
 - Create **A/AAAA** ```example.com``` and ```www.example.com``` records 
 - Run ```init.sh``` as sudo user
 - Run ```init-domain.sh %user_domain% %user_email%``` for each domain (not www.*)
 - Run ```run.sh```
