FROM ubuntu:18.04

ENV PUID=1000 PGID=1000

COPY init.sh /init.sh
RUN chmod +x /init.sh

COPY megacmd-xUbuntu_18.04_amd64.deb /root/
RUN apt-get update && \
  apt-get install -yqq gnupg2 && \
  (dpkg -i --path-include='/usr/share/doc/megacmd/*' /root/megacmd-xUbuntu_18.04_amd64.deb; exit 0;) && \
  apt-get install -fyqq && \
  apt-get clean && \
  rm -rf /root/megacmd-xUbuntu_18.04_amd64.deb

CMD ["/init.sh", "/usr/bin/mega-cmd-server"]
