#
# Dockerfile for openconnect, using SSH.
#

FROM ubuntu:latest
MAINTAINER Breno <lrabbt@gmail.com>

COPY run.sh /run.sh
RUN chmod 0755 /run.sh
RUN apt-get update && \
	apt-get install -y openconnect openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:default' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENTRYPOINT ["/run.sh"]

EXPOSE 22