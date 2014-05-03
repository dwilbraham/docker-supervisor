FROM centos

MAINTAINER dwilbraham@gmail.com

RUN yum -y update; yum clean all
RUN yum -y install supervisor openssh-server httpd; yum clean all

ADD ./supervisord.conf /etc/supervisord.conf
ADD ./start_ssh.sh /opt/start_ssh.sh
ADD ./start_apache.sh /opt/start_apache.sh

EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
