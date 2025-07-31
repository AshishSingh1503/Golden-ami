#!/bin/bash
set -e

echo "[INFO] Enforcing IMDSv2"
TOKEN_REQUIRED=true # This is enforced via instance metadata options at runtime

echo "[INFO] Disabling root SSH login"
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

echo "[INFO] Enforcing SSH key login only"
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd
