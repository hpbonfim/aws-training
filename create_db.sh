#!/bin/bash
echo "installing dependencies"
sudo yum install -y mariadb-server && sudo systemctl start mariadb
echo "dependencies done!"
echo ""
echo "creating database"
# create database
DATABASE_NAME="cadastro"
# database passwd (SAME AS AWS RDS)
RDS_DATABASE_PASSWD="mypassword"
RDS_DATABASE_SERVER="type-a1-3.cctrdcerspq6.sa-east-1.rds.amazonaws.com"

mysql \
  -u admin \
  -h $RDS_DATABASE_SERVER \
  -p$RDS_DATABASE_PASSWD \
  -e "CREATE DATABASE ${DATABASE_NAME} /*\!40100 DEFAULT CHARACTER SET utf8 */;" \
  -e "SHOW DATABASES;"

echo "database created"

echo "start cleaning"
sudo systemctl stop mariadb && sudo yum remove -y mariadb-server
echo "all cleaned up!"