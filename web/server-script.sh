#! /bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo service  httpd start
sudo echo "<h1>Welcome to landmark Technologies</h1>" | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo '<!DOCTYPE html> <html> <body style="background-colour:rgb(250, 210, 210);"> <h1>Welcome to Landmark Technologies</h1>'
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html

# Ensure that you update the inbound rules on the security group of your instance. Add http port 80