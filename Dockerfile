FROM centos:6
MAINTAINER Fábio Tramasoli <fabio@tramasoli.com>
LABEL env=des
RUN yum -y install openssh-server
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
