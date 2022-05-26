#!/bin/bash
echo "installing dependencies"
yum install -y mariadb-server
systemctl start mariadb
echo "dependencies done!"

echo `\ncreating database`
# create database
DATABASE_NAME="cadastro"
# database passwd (SAME AS AWS RDS)
DATABASE_PASSWD="mypassword"

mysql -u admin -h "type-a1-3.cctrdcerspq6.sa-east-1.rds.amazonaws.com" -p ${DATABASE_PASSWD}
mysql -u admin -e "CREATE DATABASE ${DATABASE_NAME} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
echo `database created`
mysql -u admin -e "SHOW DATABASES;"

echo `start cleaning`
systemctl stop mariadb
yum remove -y mariadb-server

echo `all cleaned up!`