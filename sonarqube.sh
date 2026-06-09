#!/bin/bash

cd /opt/

# Install required packages
sudo dnf update -y
sudo dnf install -y java-11-openjdk java-11-openjdk-devel wget unzip

# Download SonarQube
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.6.50800.zip

# Extract package
unzip sonarqube-8.9.6.50800.zip

# Create sonar user
sudo useradd sonar

# Set ownership and permissions
sudo chown -R sonar:sonar sonarqube-8.9.6.50800
sudo chmod -R 755 sonarqube-8.9.6.50800

# Open firewall port 9000
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload

# Switch to sonar user
su - sonar

# Start SonarQube manually
# sh /opt/sonarqube-8.9.6.50800/bin/linux-x86-64/sonar.sh start

# Default Login:
# Username: admin
# Password: admin
