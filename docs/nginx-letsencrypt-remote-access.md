# NGINX & Let's Encrypt

* Documentation for this can be found [here](https://community.home-assistant.io/t/homeassistant-nginx-ssl-proxy-setup/53?u=brianjking), however, I wanted to consolidate it into a single document.

## Installation

* Install NGINX

````sudo apt-get install nginx````

* Make NGINX run at boot

````sudo update-rc.d nginx defaults````

* Let's get some HTTPS support via Let's Encrypt

````
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt/
./letsencrypt-auto --server \ https://acme-v01.api.letsencrypt.org/directory --help
````

* More Let's Encrypt

````
./letsencrypt-auto certonly --standalone
````

## Configure NGINX

````sudo chmod -R 744 /etc/letsencrypt/live/YOUR_DOMOAIN/````

* Harden the security

````
cd /etc/ssl/certs
sudo openssl dhparam -out dhparam.pem 4096
````


