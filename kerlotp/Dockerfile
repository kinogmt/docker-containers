FROM fedora:23
ENV VVV=/usr/local/docker
ENV VER=17.4

ADD kerl /usr/bin/kerl
RUN (mkdir -p $VVV; \
     kerl list releases; \
     env KERL_CONFIGURE_OPTIONS=--enable-halfword-emulator kerl build $VER ${VER}_halfword)
RUN kerl install ${VER}_halfword $VVV/erl

EXPOSE 22
CMD ["/usr/local/startservice.sh"]

