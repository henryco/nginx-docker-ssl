# Dockerized nginx with ssl domains

### How to:

 - Clone or download repository into your local directory
 - Create **A/AAAA** domain record  
 - Run ```init.sh``` as sudo user
 - Run ```init-domain.sh %user_domain% %user_email%``` for each domain
 - Run ```run.sh```
 
It will start fully configured ```nginx``` and ```certbot``` docker containers with your domains with SSL certificates.
Cerbot container will also automatically renew all certificates.
