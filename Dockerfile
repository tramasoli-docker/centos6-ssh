FROM centos:6
MAINTAINER Fábio Tramasoli <fabio@tramasoli.com>
LABEL env=des
RUN yum -y install openssh-server shadow-utils && \
    service sshd start && \
    service sshd stop && \
    echo "root:hackme" | chpasswd
EXPOSE 22
CMD ["/usr/sbin/ssh","-D"]
