#!/bin/bash
set -e

echo "[INFO] Updating OS"
sudo apt update -y && sudo apt upgrade -y

echo "[INFO] Installing SSM Agent"
sudo snap install amazon-ssm-agent --classic
sudo systemctl enable --now amazon-ssm-agent

echo "[INFO] Installing CloudWatch Agent"
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i amazon-cloudwatch-agent.deb

echo "[INFO] Creating deploy user"
sudo useradd -m -s /bin/bash deploy
echo "Golden AMI baseline installed at $(date)" > /etc/motd
