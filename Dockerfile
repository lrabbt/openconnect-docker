#
# Dockerfile for openconnect, using SSH.
#

FROM ubuntu:latest
MAINTAINER Breno <lrabbt@gmail.com>

COPY run.sh /run.sh
RUN chmod 0755 /run.sh
RUN apt-get update && \
	apt-get install -y openconnect openssh-server sshpass
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

ENV SSH_PWD='default'
ENV DETACHED='TRUE'

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Set rsa keys
RUN ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''

ENTRYPOINT ["/run.sh"]

EXPOSE 22