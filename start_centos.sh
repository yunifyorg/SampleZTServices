#!/bin/sh
curl https://install.zerotier.com/ | bash

/usr/sbin/zerotier-one -d

sleep 2

/usr/sbin/zerotier-cli join 8056c2e21c000001

python /server.py