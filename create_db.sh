#!/bin/bash
echo "installing dependencies"
sudo yum install -y mariadb-server && sudo systemctl start mariadb
echo "dependencies done!"
echo ""
echo "creating database"
# create database
DATABASE_NAME="cadastro"
# database passwd (SAME AS AWS RDS)
DATABASE_PASSWD="mypassword"

mysql \
  -u admin \
  -h "type-a1-3.cctrdcerspq6.sa-east-1.rds.amazonaws.com" \
  -p$DATABASE_PASSWD \
  -e "DROP DATABASE ${DATABASE_NAME};" \
  -e "CREATE DATABASE ${DATABASE_NAME} /*\!40100 DEFAULT CHARACTER SET utf8 */;" \
  -e "SHOW DATABASES;"

echo "database created"

echo "start cleaning"
sudo systemctl stop mariadb && sudo yum remove -y mariadb-server
echo "all cleaned up!"