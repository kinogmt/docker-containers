FROM centos:7
ENV VVV=/usr/local/docker
ENV VER=19.2
ENV LOG=/root/.kerl/builds/${VER}_halfword/otp_build_${VER}.log

ADD kerl /usr/bin/kerl
RUN yum install -y gcc tar make perl ncurses-devel openssl-devel patch unzip
RUN (mkdir -p $VVV; \
     kerl list releases; \
     env KERL_CONFIGURE_OPTIONS=--enable-halfword-emulator kerl build $VER ${VER}_halfword; true)
RUN (touch ${LOG}; cat ${LOG})
RUN kerl install ${VER}_halfword $VVV/erl.${VER}

ADD startservice.sh /usr/local/startservice.sh


EXPOSE 22
CMD ["/usr/local/startservice.sh"]

