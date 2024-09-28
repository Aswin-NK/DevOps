#! /bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
echo "Hi Welcome to Webserver1" >> /var/www/html/index.html
