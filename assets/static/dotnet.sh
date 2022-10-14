#!/bin/bash

apt-get update
wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get install -y apt-transport-https
apt-get update
apt-get install -y aspnetcore-runtime-5.0
rm packages-microsoft-prod.deb

curl ifconfig.me
echo ''
