#!/bin/bash
echo "installing dependencies"
sudo yum install -y mariadb-server && sudo systemctl start mariadb
echo "dependencies done!"
echo ""
echo "creating database"
# create database
DATABASE_NAME="cadastro"

mysql -u admin -h "type-a1-3.cctrdcerspq6.sa-east-1.rds.amazonaws.com" -p
mysql -u admin -e "CREATE DATABASE ${DATABASE_NAME} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
echo "database created"
mysql -u admin -e "SHOW DATABASES;"

echo "start cleaning"
sudo systemctl stop mariadb && sudo yum remove -y mariadb-server
echo "all cleaned up!"