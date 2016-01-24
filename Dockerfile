FROM centos:6
MAINTAINER Fábio Tramasoli <fabio@tramasoli.com>
LABEL env=des
RUN yum -y install openssh-server shadow-utils
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t dsa
RUN echo "root:hackme" | chpasswd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
