FROM resin/rpi-raspbian:stretch

ADD https://mega.nz/linux/MEGAsync/Raspbian_9.0/arm/megacmd-Raspbian_9.0_armhf.deb /root/
RUN dpkg -i /root/megacmd-Raspbian_9.0_armhf.deb; exit 0; 
RUN apt-get update
RUN apt-get install -fy
RUN apt-get clean
COPY init.sh /init.sh
RUN chown root:root /init.sh && chmod 744 /init.sh
ENV PUID=1000 PGID=100

CMD ["/init.sh", "/usr/bin/mega-cmd-server"]
