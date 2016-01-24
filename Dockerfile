FROM centos:6
MAINTAINER Fábio Tramasoli <fabio@tramasoli.com>
LABEL env=des
RUN yum -y install openssh-server shadow-utils
RUN rm -r /etc/ssh/ssh*key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key 
RUN echo "root:hackme" | chpasswd
EXPOSE 22
CMD ["/usr/sbin/ssh","-D"]
