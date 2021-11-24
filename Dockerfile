FROM ubuntu:focal
RUN apt update; apt install -y curl perl ; rm -fr /var/cache/apt /var/lib/apt
ADD src/texlive.profile /etc/
RUN curl -vL https://ftp.yz.yamagata-u.ac.jp/pub/CTAN/systems/texlive/tlnet/install-tl-unx.tar.gz | tar xz; \
    cd install-tl-*; ./install-tl --profile /etc/texlive.profile; \
    cd ..; rm -vfr install-tl-*
ENV PATH /usr/local/texlive/bin:$PATH
RUN mkdir -pv /usr/local/texlive; \
    ln -s $(dirname $(find /usr/local/texlive -name 'tex' | grep '/bin/' | head -n1)) /usr/local/texlive/bin
WORKDIR /work
