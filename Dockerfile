FROM ubuntu:18.04

ADD https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megacmd-xUbuntu_18.04_amd64.deb /root/
RUN apt-get update && \
  apt-get install -yqq gnupg2 && \
  (dpkg -i --path-include='/usr/share/doc/megacmd/*' /root/megacmd-xUbuntu_18.04_amd64.deb; exit 0;) && \
  apt-get install -fyqq && \
  apt-get clean
COPY init.sh /init.sh
ENV PUID=1000 PGID=1000

CMD ["/init.sh", "/usr/bin/mega-cmd-server"]
