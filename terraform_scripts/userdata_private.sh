#!/bin/bash
sudo sed -i 's!PasswordAuthentication no!PasswordAuthentication yes!g' /etc/ssh/sshd_config
sudo useradd loylogic
echo -e "loylogic\nloylogic" | sudo passwd loylogic
sudo usermod -aG wheel loylogic
sudo systemctl restart sshd

sudo yum install -y java