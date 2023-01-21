#!/bin/bash
hostnamectl set-hostname ${server-name}
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo yum install git -y
sudo git clone https://github.com/ccseyhan/wordpress_deployment_terraform.git /home/ec2-user/wordpress_deployment_terraform
docker-compose -f /home/ec2-user/wordpress_deployment_terraform/docker-compose.yaml up --build -d