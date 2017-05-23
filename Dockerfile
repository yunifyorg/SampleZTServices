FROM debian:latest
# Warning Ubuntu 4.8.0-49 has a kernel bug that make ZT incompatible
# See https://support.zerotier.com/hc/en-us/articles/115006620828-Kernel-Issue-in-Ubuntu-16-04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
clang \
curl \
git \
libsqlite3-dev \
make \
ruby-ronn \
sqlite3 \
python-pip \
&& rm -rf /var/lib/apt/lists/* \
&& pip install flask

ENV ZEROTIER_VERSION 1.2.4

RUN mkdir -p /app/source \
&& cd /app/source && git clone https://github.com/zerotier/ZeroTierOne.git \
&& cd /app/source/ZeroTierOne && git checkout tags/$ZEROTIER_VERSION \
&& cd /app/source/ZeroTierOne \
&& make ZT_ENABLE_NETWORK_CONTROLLER=1 \
&& make install \
&& rm -rf /app/source \
&& apt-get remove -y \
clang \
git \
make

# You may need this if you get a PORT_ERROR after joining a network
# You may also need to install modeprobe
#RUN /modeprobe tun \
#&& ln -sf /dev/net/tun /dev/tun


ADD start_debian.sh /start.sh

ADD server.py /server.py

RUN chmod +x /start.sh

EXPOSE 9993/udp 5000

ENTRYPOINT ["/start.sh"]
