# This is based on itzg/minecraft-server

FROM openjdk:8-alpine

RUN apk update && apk add wget unzip bash

RUN mkdir /SK4/ && cd /SK4/ && \
	wget -c https://media.forgecdn.net/files/2787/18/SkyFactory_4_Server_4.1.0.zip -O SF4.zip && \
	unzip SF4.zip && \
	rm SF4.zip && \
	cd Sky* &&\
	bash -x Install.sh

EXPOSE 25565

ADD start.sh /start

VOLUME /data
WORKDIR /data

CMD /start


ENV LEVEL world
ENV JVM_OPTS -Xms2048m -Xmx4098m
