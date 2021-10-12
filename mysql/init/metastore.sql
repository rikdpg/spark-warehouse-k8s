CREATE DATABASE IF NOT EXISTS metastore; 

/* create hive user */
CREATE USER 'hive'@'%' IDENTIFIED WITH mysql_native_password BY 'hive1234';
GRANT ALL PRIVILEGES ON metastore . * TO 'hive'@'%';