FROM fedora:22
ENV VVV=/usr/local/docker
ENV VER=17.4

ADD kerl /usr/bin/kerl
RUN dnf install -y gcc tar make perl ncurses-devel openssl-devel
RUN (mkdir -p $VVV; \
     kerl list releases; \
     env KERL_CONFIGURE_OPTIONS=--enable-halfword-emulator kerl build $VER ${VER}_halfword; true)
###RUN  cat /root/.kerl/builds/${VER}_halfword/otp_build_${VER}.log
RUN kerl install ${VER}_halfword $VVV/erl.${VER}

ADD startservice.sh /usr/local/startservice.sh


EXPOSE 22
CMD ["/usr/local/startservice.sh"]

