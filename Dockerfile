FROM ubuntu:focal
ENV TZ=Asia/Tokyo
ARG http_proxy
ARG https_proxy
ARG DEBIAN_FRONTEND=noninteractive
RUN echo Asia/Tokyo > /etc/timezone; \
    apt update; apt install -y locales tzdata curl perl ; rm -fr /var/cache/apt /var/lib/apt
RUN sed -i -r 's;^# +ja_JP.UTF-8;ja_JP.UTF-8;' /etc/locale.gen; \
    locale-gen; update-locale LANG=ja_JP.UTF-8
ADD src/texlive.profile /etc/
RUN curl -vL https://ftp.yz.yamagata-u.ac.jp/pub/CTAN/systems/texlive/tlnet/install-tl-unx.tar.gz | tar xz; \
    cd install-tl-*; ./install-tl --profile /etc/texlive.profile; \
    cd ..; rm -vfr install-tl-*
ENV PATH /usr/local/texlive/bin:$PATH
RUN mkdir -pv /usr/local/texlive; \
    ln -s $(dirname $(find /usr/local/texlive -name 'tex' | grep '/bin/' | head -n1)) /usr/local/texlive/bin
WORKDIR /work
