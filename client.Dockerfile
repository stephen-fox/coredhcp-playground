FROM centos:7.6.1810

RUN yum -y update \
    && yum clean all \
    && yum -y install tcpdump

COPY build/client /client

ENTRYPOINT /bin/bash

CMD /sbin/init
