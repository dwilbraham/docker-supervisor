FROM fedora

MAINTAINER dwilbraham@gmail.com

RUN yum -y update; yum clean all
RUN yum -y install supervisor openssh-server httpd; yum clean all

ADD ./supervisord.conf /etc/supervisord.conf
ADD ./start_apache.sh /opt/start_apache.sh

ADD ./add_ssh_user.sh /opt/add_ssh_user.sh
RUN /opt/add_ssh_user.sh
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

EXPOSE 22 80
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
