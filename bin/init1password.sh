#!/bin/sh
echo -n "Secret Key for dan@hld.ca at 1password:"

read -s secret

echo ""

op signin my.1password.com dan@hld.ca $secret
