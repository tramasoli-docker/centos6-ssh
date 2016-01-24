FROM centos:6
MAINTAINER Fábio Tramasoli <fabio@tramasoli.com>
LABEL env=des
RUN yum -y install openssh-server shadow-utils
RUN echo "ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa" > /usr/local/sbin/ssh-startup.sh
RUN echo "ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t dsa" >> /usr/local/sbin/ssh-startup.sh
RUN echo "/usr/sbin/sshd -D" >> /usr/local/sbin/ssh-startup.sh
RUN echo "root:hackme" | chpasswd
EXPOSE 22
CMD ["/bin/bash /usr/sbin/ssh-startup.sh"]
