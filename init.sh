#! /bin/bash


yum update
yum install -y gcc gcc-c++

# nginx
NGINX_VERSION=1.16.0

wget https://nginx.org/download/nginx-$NGINX_VERSION.tar.gz
tar -zxvf nginx-$NGINX_VERSION.tar.gz
cd nginx-$NGINX_VERSION

./configure --user=www --group=www --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module --with-openssl=../libressl-2.9.0 --with-http_v2_module --with-pcre=../pcre-8.42 --with-zlib=../zlib-1.2.11

make && make install

# mariaDB
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
yum install -y mariadb-server mariadb

# php
yum install -y php php-mysql php-fpm


# /etc/php-fpm.d/www.conf

# listen = /tmp/php-cgi.sock
# listen.owner = www
# listen.group = www
# listen.mode = 0666
