#!/bin/bash
set -e

echo "[INFO] Checking installed tools"
command -v amazon-ssm-agent
command -v amazon-cloudwatch-agent

echo "[INFO] Checking agent status"
sudo systemctl status amazon-ssm-agent | grep active
