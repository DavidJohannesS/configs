#!/bin/bash

sudo mkdir -p /etc/ansible/
read -p "How many hosts would you like to add?" hostnumber
for ((i=1;i<=hostnumber;i++))
do
	read -p "Please Enter host $i name: " hostname
	read -p "Please enter it's IP addres: " hostip
	sudo echo -e "[$hostname]\n$hostip" | sudo tee -a /etc/ansible/hosts
done
sudo nala install sshpass -y
