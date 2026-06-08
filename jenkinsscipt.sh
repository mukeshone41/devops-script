#!/bin/bash

echo "========== STEP 0: Update System =========="
sudo yum update -y

echo "========== STEP 1: Install Required Tools =========="
sudo yum install -y git maven wget

echo "========== STEP 2: Install Java 17 (Corretto) =========="
sudo yum install -y https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.rpm

echo "Java Version:"
java -version

echo "========== STEP 3: Add Jenkins Repository =========="
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

echo "========== STEP 4: Install Jenkins =========="
sudo yum install -y jenkins

echo "========== STEP 5: Start Jenkins =========="
sudo systemctl daemon-reload
sudo systemctl start jenkins

echo "========== STEP 6: Enable Jenkins on Boot =========="
sudo systemctl enable jenkins

echo "========== STEP 7: Check Jenkins Status =========="
sudo systemctl status jenkins

echo "========== STEP 8: Get Initial Admin Password =========="
sleep 20
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
