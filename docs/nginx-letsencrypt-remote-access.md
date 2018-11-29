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

Contents of `/etc/nginx/sites-enabled/default`:

```
server{
        listen 80;
        server_name redacted.ddns.net;
        return 301 https://$server_name$request_uri;


}
server {
        listen 443 ssl;
        server_name redacted.ddns.net;
        ssl on;

    # For self signed certs
    # ssl_certificate /etc/nginx/cert.crt;
    # ssl_certificate_key /etc/nginx/cert.key;

    # For Let's Encrypt certs
    ssl_certificate /etc/letsencrypt/live/redacted.ddns.net/fullchain.pem; # managed by Certbot
 # /etc/nginx/cert.crt;
    ssl_certificate_key /etc/letsencrypt/live/redacted.ddns.net/privkey.pem; # managed by Certbot
 # /etc/nginx/cert.key;

    # Things for better security
    ssl_session_cache shared:SSL:10m;
    # I am using all modern devices and browsers and don't need TLSv1 if you need it, add to the list below
    ssl_protocols TLSv1.1 TLSv1.2;
    ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH';
    ssl_prefer_server_ciphers on;
    ssl_dhparam /etc/ssl/certs/dhparam.pem;

    # For quicker streaming updates in HA. Thanks @stephenmg12
    proxy_buffering off;

    location / {
            proxy_pass http://localhost:8123;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection $connection_upgrade;
    }

}

```
