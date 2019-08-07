FROM centos:7.6.1810

RUN yum -y update \
    && yum clean all \
    && yum -y install tcpdump

RUN configFilePath='/etc/coredhcp/config.yml' \
    && mkdir -p "${configFilePath%/*}" \
    && echo -e 'server4:\n\
    listen: "0.0.0.0:67"\n\
    interface: "eth0"\n\
    plugins:\n\
        - example:\n\
        - server_id: 192.168.1.12\n'\
    > "${configFilePath}"

COPY build/server /server

ENTRYPOINT /bin/bash

CMD /sbin/init
