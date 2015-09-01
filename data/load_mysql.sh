#!/bin/bash

mysqladmin -u root -h 192.168.0.2 drop todo
mysqladmin -u root -h 192.168.0.2 create todo
mysql -u root -h 192.168.0.2 todo < todo.mysql.sql
