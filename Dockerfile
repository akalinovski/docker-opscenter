# Version 1.2

FROM abh1nav/python

MAINTAINER Abhinav Ajgaonkar <abhinav316@gmail.com>

ADD opscenter-5.2.4.tar.gz /opt
RUN mv /opt/opscenter-5.2.4 /opt/opscenter
ADD	. /src

# Copy over daemons
RUN	\
  mkdir -p /etc/service/opscenter; \
  cp /src/run /etc/service/opscenter/; \
  ln -s /opt/opscenter/log /var/log/opscenter;

# Expose ports
EXPOSE 8888

WORKDIR /opt/opscenter

CMD ["/sbin/my_init"]

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
