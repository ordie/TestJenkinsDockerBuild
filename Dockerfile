FROM ubuntu:16.04
MAINTAINER Xin.Wang@harman.com
WORKDIR /opt/Python-3.9.1
ADD  Python-3.9.1.tar.xz /opt 
COPY *.rpm /home/sqlplus/
RUN  apt-get update && apt-get install -y \
     && apt-get install gcc -y && apt-get install make -y \
     && apt-get install vim -y && apt-get install openssl -y \
     && apt-get install libssl-dev -y && apt-get install python3-pip -y \
     && ./configure --prefix=/usr/local/python3.9.1 \
     && make && make install \
     && apt-get install alien -y \
     && alien -i /home/sqlplus/oracle-instantclient-basic-21.1.0.0.0-1.x86_64.rpm \
     && alien -i /home/sqlplus/oracle-instantclient-sqlplus-21.1.0.0.0-1.x86_64.rpm \
     && alien -i /home/sqlplus/oracle-instantclient-devel-21.1.0.0.0-1.x86_64.rpm \
     && apt-get install libaio1 -y \
     && ldconfig 
CMD [""]
ENV PATH $PATH:/usr/local/python3.9.1/bin
