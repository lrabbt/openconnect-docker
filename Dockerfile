#
# Dockerfile for openconnect, using SSH.
#

FROM ubuntu:latest
MAINTAINER Breno <lrabbt@gmail.com>

COPY run.sh /run.sh
RUN chmod 0755 /run.sh
RUN apt-get update && \
	apt-get install -y openconnect openssh-server

ENTRYPOINT ["/run.sh"]

EXPOSE 22