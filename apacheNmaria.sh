#! /bin/bash
echo "password" | sudo -S service apache2 start
sudo systemctl start mariadb
