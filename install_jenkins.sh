#! /bin/bash

sudo apt update

sudo apt install -y openjdk-17-jre

sudo apt install -y default-jdk

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]  https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update

sudo apt install ca-certificates

sudo apt-get install -y fontconfig

sudo apt-get install jenkins -y

sudo usermod -a -G docker jenkins

sudo adduser jenkins docker
