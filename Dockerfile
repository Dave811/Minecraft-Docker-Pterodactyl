FROM ubuntu:18.04 

#ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y curl wget file bzip2 gzip unzip openjdk-8-jre

RUN useradd -d /home/container -s /bin/bash -u 999 container

RUN touch ServerStart.sh
RUN chmod 777 ServerStart.sh
RUN chown container ServerStart.sh

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]