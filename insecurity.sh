#!/bin/bash
apt-get install wget
wget https://edshare.gcu.ac.uk/id/document/59385 -O insecurity.tar.gz
tar -xzvf insecurity.tar.gz
echo "installed"
apt-get install -y default-mysql-client
echo "created client"
mysql -u root --password=MYSQL_ROOT_PASSWORD --port 3306 -h db  < ./insecurity/security.sql
rm ./insecurity/security.sql
cp -R ./insecurity/* /var/www/html
rm -rf insecurity
rm insecurity.tar.gz