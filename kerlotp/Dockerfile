FROM fedora:22
ARG VVV=/usr/local/docker
ARG VER=17.4

ADD kerl /usr/bin/kerl
RUN dnf install -y gcc tar make
RUN (mkdir -p $VVV; \
     kerl list releases; \
     env KERL_CONFIGURE_OPTIONS=--enable-halfword-emulator kerl build $VER ${VER}_halfword; \
     cat /root/.kerl/builds/${VER}_halfword/otp_build_${VER}.log)
RUN kerl install ${VER}_halfword $VVV/erl

EXPOSE 22
CMD ["/usr/local/startservice.sh"]

