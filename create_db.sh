#!/bin/bash
# create database
DATABASE_NAME="cadastro"
mysql -u root -e "CREATE DATABASE ${DATABASE_NAME} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
echo `#{DATABASE_NAME} created`