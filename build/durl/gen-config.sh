#!/bin/bash

myIp=$(ip a | grep "$(ip route | grep default | awk '{print $NF}'):" -A 4 | grep global |awk '{print $2}' | cut -d'/' -f1)
sed -i "s/127.0.0.1/${myIp}/g" $(grep -rl '3306' ./)
