FROM garland/dockerfile-ubuntu-gnome

RUN apt-get update -y
RUN apt-get install -y gtk2.0
RUN apt-get install -y python-software-properties && apt-get install -y apt-file && apt-file update && apt-file search add-apt-repository && apt-get install -y software-properties-common
RUN add-apt-repository ppa:avsm/ppa && apt-get -y update && apt-get -y install ocaml ocaml-native-compilers camlp4-extra opam

RUN apt-get install -y make m4 pkg-config
RUN opam init && eval `opam config env` && opam install proverif && opam depext proverif
RUN echo '. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true' >> ~/.bashrc
