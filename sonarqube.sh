#!/bin/bash

echo "========== STEP 1: Update System =========="
sudo dnf update -y

echo "========== STEP 2: Install Java 21 and Required Packages =========="
sudo dnf install -y java-21-openjdk java-21-openjdk-devel wget unzip

echo "========== STEP 3: Verify Java =========="
java -version

echo "========== STEP 4: Move to /opt =========="
cd /opt

echo "========== STEP 5: Download SonarQube =========="
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.6.50800.zip

echo "========== STEP 6: Extract SonarQube =========="
sudo unzip sonarqube-8.9.6.50800.zip

echo "========== STEP 7: Create Sonar User =========="
id sonar >/dev/null 2>&1 || sudo useradd sonar

echo "========== STEP 8: Set Ownership =========="
sudo chown -R sonar:sonar /opt/sonarqube-8.9.6.50800
sudo chmod -R 755 /opt/sonarqube-8.9.6.50800

echo "========== STEP 9: Configure Firewall =========="
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload

echo "========== STEP 10: SonarQube Installation Complete =========="

echo ""
echo "Run the following commands manually:"
echo "-----------------------------------"
echo "su - sonar"
echo "cd /opt/sonarqube-8.9.6.50800/bin/linux-x86-64"
echo "./sonar.sh start"
echo "-----------------------------------"
echo "Access URL: http://<SERVER-IP>:9000"
echo "Username: admin"
echo "Password: admin"
