#!/bin/bash

mkdir /etc/vbox 2> /dev/null
echo '* 192.168.10.0/24' | tee /etc/vbox/networks.conf > /dev/null
