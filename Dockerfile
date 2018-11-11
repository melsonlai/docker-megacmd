FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -yqq gnupg2
ADD https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megacmd-xUbuntu_18.04_amd64.deb /root/
RUN dpkg -i --path-include='/usr/share/doc/megacmd/*' /root/megacmd-xUbuntu_18.04_amd64.deb; exit 0; 
RUN apt-get install -fyqq
RUN apt-get clean
COPY init.sh /init.sh
RUN chown root:root /init.sh && chmod 744 /init.sh
ENV PUID=1000 PGID=1000

CMD ["/init.sh", "/usr/bin/mega-cmd-server"]
