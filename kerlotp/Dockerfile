FROM fedora:22
ARG VVV=/usr/local/docker
ARG VER=17.4

ADD kerl /usr/bin/kerl
RUN dnf install -y gcc tar ncurses-devel perl bc patch
RUN (mkdir -p $VVV; \
     kerl list releases; \
     env KERL_CONFIGURE_OPTIONS=--enable-halfword-emulator kerl build $VER ${VER}_halfword)
RUN kerl install ${VER}_halfword $VVV/erl

EXPOSE 22
CMD ["/usr/local/startservice.sh"]

