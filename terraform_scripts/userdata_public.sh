#!/bin/bash
sudo sed -i 's!PasswordAuthentication no!PasswordAuthentication yes!g' /etc/ssh/sshd_config
sudo useradd loylogic
echo -e "loylogic\nloylogic" | sudo passwd loylogic
sudo usermod -aG wheel loylogic
sudo systemctl restart sshd

## Install Jenkins ##
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install jenkins java-1.8.0-openjdk-devel -y
sudo systemctl daemon-reload
sudo systemctl start jenkins

sudo wget https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-13.noarch.rpm
sudo rpm -ivh epel-release*
sudo yum repolist -y
sudo yum install ansible -y