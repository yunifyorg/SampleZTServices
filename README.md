## Sample ZT services

These are some sample services to help you get started on a Zerotier network super fast.
There are two samples provided. In each of these I installed ZT in a different way in order to maximize entertainment value.

#### Build and run the container

```
docker build --tag=sample_service .

docker run -dit --rm --cap-add=NET_ADMIN --cap-add=SYS_ADMIN --device=/dev/net/tun sample_service
```

#### Make sure it works

```

docker exec -i <CONTAINER_NAME> /bin/bash

zerotier-cli listnetworks # /usr/sbin/zerotier-cli in centos
```
Should show that you are now a part of Zerotier's public network.
