FROM centos:7

RUN yum clean all 
RUN yum install -y wget
RUN yum groupinstall -y "Development tools"
RUN yum install -y ncurses-devel libuuid-devel jansson-devel libxml2-devel sqlite-devel

ADD http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-14-current.tar.gz /tmp/
ADD http://downloads.asterisk.org/pub/telephony/dahdi-linux-complete/dahdi-linux-complete-current.tar.gz /tmp/

#RUN cd /tmp && \ 
#tar xofz asterisk-*.tar.gz && \
#tar xofz dahdi-linux-complete-current.tar.gz 
cd asrerisk-*
./configure
make menuselect
./menuselect/menuselect --enable 

ENTRYPOINT ["/bin/bash"]
	 
