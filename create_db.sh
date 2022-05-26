#!/bin/bash
# create database
DATABASE_NAME="cadastro"
mysql –u admin –h "type-a1-3.cctrdcerspq6.sa-east-1.rds.amazonaws.com"
mysql -u admin -e "CREATE DATABASE ${DATABASE_NAME} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
echo `database created`
mysql -u admin -e "SHOW DATABASES;"