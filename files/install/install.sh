#!/bin/sh
tar xvf nginx-1.0.6.tar.gz
tar xvf cep21-healthcheck_nginx_upstreams-b33a846.tar.gz
cd nginx-1.0.6/
patch -p1 < ../cep21-healthcheck_nginx_upstreams-b33a846/nginx.patch
vim README
./configure --add-module=../cep21-healthcheck_nginx_upstreams-b33a846/
make
make install
