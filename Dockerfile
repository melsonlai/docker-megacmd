FROM balenalib/rpi-debian:stretch-run

COPY qemu-arm-static /usr/bin/
COPY megacmd-Raspbian_9.0_armhf.deb /root/
RUN apt-get update && \
  (dpkg -i /root/megacmd-Raspbian_9.0_armhf.deb; exit 0;) && \
  apt-get install -fyqq && \
  apt-get clean
COPY init.sh /init.sh
RUN chmod +x /init.sh
ENV PUID=1000 PGID=1000

CMD ["/init.sh", "/usr/bin/mega-cmd-server"]
