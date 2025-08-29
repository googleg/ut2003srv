FROM ubuntu:24.04

ARG serverpkg

RUN apt update
RUN apt-get install -y libc6-i386 bzip2
RUN dpkg --add-architecture i386
RUN apt update
RUN apt-get install -y libgcc-s1:i386

ENV CDKEY=4X7Y-M5KD-TS99-JECJ
ENV WEBUSER=admin
ENV WEBPASS=sekrit
ENV INIFILE=Default.ini
ENV MAP=CTF-Face3


RUN mkdir -p /opt/ut2003srv
COPY $serverpkg /tmp/install.tar
WORKDIR /opt/ut2003srv
RUN tar -xvf /tmp/install.tar
RUN rm /tmp/install.tar
RUN echo $CDKEY >> /opt/ut2003srv/ut2003_dedicated/System/cdkey
WORKDIR /opt/ut2003srv/ut2003_dedicated/System
RUN sed -i 's/bEnabled=False/bEnabled=True\nListenPort=8088/' Default.ini
RUN sed -i 's/ut2003master1.epicgames.com/utmaster.openspy.net/' Default.ini
RUN sed -i 's/NvidiaLogo.ut2/CTF-Face3.ut2/' Default.ini

CMD ["/bin/sh", "-c", "cp --update=none Default.ini $INIFILE && linux32 ./ucc-bin server $MAP?AdminName=$WEBUSER?AdminPassword=$WEBPASS -nohomedir -ini=$INIFILE"]
