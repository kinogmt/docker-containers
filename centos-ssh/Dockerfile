FROM centos:6.7

##########################################################################
### update glibc-common for locale files
RUN yum update -y glibc-common

##########################################################################
# all yum installations here
RUN yum install -y sudo passwd openssh-server openssh-clients tar screen crontabs strace telnet perl libpcap bc patch


# start sshd to generate host keys
RUN (service sshd start; \
      sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config; \
      sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config; \
      sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/CentOS-Base.repo)

RUN (sed -i -e "s/#PermitRootLogin yes/PermitRootLogin yes/" /etc/ssh/sshd_config)


##########################################################################
# passwords 
RUN echo "root:password" | chpasswd

EXPOSE 22
CMD service crond start; /usr/sbin/sshd -D
