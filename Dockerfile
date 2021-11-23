FROM ubuntu:focal
RUN apt update; apt install -y curl perl ; rm -fr /var/cache/apt /var/lib/apt
WORKDIR /work
ADD src/texlive.profile .
RUN curl -sL https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar xvz; \
    cd install-tl-*; ./install-tl --profile ../texlive.profile; \
    cd ..; rm -vfr install-tl-* texlive.profile
