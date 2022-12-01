from ubuntu


RUN apt update
RUN apt install wget -y
RUN wget --progress=dot:giga -O /tmp/od.deb https://packages.rapidloop.com/downloads/opsdash-server_1.9.2_amd64.deb
RUN DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/od.deb

RUN mkdir /start
COPY entrypoint.sh /start
RUN chmod +x /start/entrypoint.sh

EXPOSE 8080
EXPOSE 6273
EXPOSE 6273/udp

CMD ["/usr/sbin/opsdash-server"]
ENTRYPOINT ["/start/entrypoint.sh"]
