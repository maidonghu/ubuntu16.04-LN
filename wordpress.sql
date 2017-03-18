DROP DATABASE if exists wordpress;
CREATE DATABASE wordpress;
CREATE USER 'wpuser' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser';
