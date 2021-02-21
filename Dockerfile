FROM python:3.8-slim-buster
MAINTAINER WangXin <Xin.Wang@harman.com>
COPY *.rpm /home/sqlplus/
RUN apt-get update \
    && apt-get install alien -y \
    && alien -i /home/sqlplus/oracle-instantclient-basic-21.1.0.0.0-1.x86_64.rpm \
    && alien -i /home/sqlplus/oracle-instantclient-sqlplus-21.1.0.0.0-1.x86_64.rpm \
    && alien -i /home/sqlplus/oracle-instantclient-devel-21.1.0.0.0-1.x86_64.rpm \
    && apt-get install libaio1 -y \
    && ldconfig \
    && apt-get --purge remove alien -y \
    && apt-get autoremove alien -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN mkdir -p /home
WORKDIR /home
CMD ["bash"]# 
