#!/bin/sh
apt-get update
apt-get install nginx git -y
sudo rm -rf /var/www/html/*
sudo git clone https://fhoubart@bitbucket.org/fhoubart/testphaser_aws.git /var/www/html/
sudo mv /var/www/html/public_html/* /var/www/html/