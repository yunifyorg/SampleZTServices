#!/bin/sh
zerotier-one -d

sleep 2

zerotier-cli join 8056c2e21c000001

python /server.py