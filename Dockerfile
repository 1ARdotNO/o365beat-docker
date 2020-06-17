FROM ubuntu:latest
ENV o365beat_version 1.5.1

ADD https://github.com/counteractive/o365beat/releases/download/v${o365beat_version}/o365beat-${o365beat_version}-amd64.deb /tmp/

RUN apt-get install /tmp/o365beat-${o365beat_version}-amd64.deb
RUN apt-get update
RUN apt-get install ca-certificates -y

COPY o365beat.yml /etc/o365beat/

CMD ["/usr/bin/o365beat"]
