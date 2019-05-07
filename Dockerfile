FROM balenalib/rpi-debian:stretch-run

LABEL maintainer="melsonlai"

ENV PUID=1000 PGID=1000
VOLUME ["/home/d_user"]
COPY qemu-arm-static /usr/bin/

COPY init.sh /init.sh
RUN chmod +x /init.sh

COPY megacmd-Raspbian_9.0_armhf.deb /root/
RUN apt-get update && \
  (dpkg -i /root/megacmd-Raspbian_9.0_armhf.deb; exit 0;) && \
  apt-get install -fyqq && \
  apt-get clean && \
  rm -rf /root/megacmd-Raspbian_9.0_armhf.deb

CMD ["/init.sh", "/usr/bin/mega-cmd-server"]
