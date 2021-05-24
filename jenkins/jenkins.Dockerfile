# dockerfile for setting up docker in docker for jenkins ci pipelines

FROM jenkins/jenkins:latest

USER root

# Install docker and create docker group
RUN curl -sSL https://get.docker.com/ | sh

# note: this is not enough on WSL2 hosts
# docker group gid and jenkins user uid
# have to match on both host and container
RUN usermod -a -G docker jenkins
RUN newgrp docker
USER jenkins


## lazy workaround for Windows/WSL2: this will set jenkins user permissions
## on host side, which is not advicable from security point of view.

# USER root
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#     acl && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Afterwards inside a running container:
## setfacl -m user:jenkins:rw /var/run/docker.sock
## su jenkins