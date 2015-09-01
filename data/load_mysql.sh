#!/bin/bash

mysqladmin -u root drop todo
mysqladmin -u root create todo
mysql -u root todo < todo.mysql.sql