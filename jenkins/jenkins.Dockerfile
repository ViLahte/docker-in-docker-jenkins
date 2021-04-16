# dockerfile for setting up docker in docker for jenkins ci pipelines

FROM jenkins/jenkins:latest

USER root

# Install docker and create docker group
RUN curl -sSL https://get.docker.com/ | sh

# note: this is not enough on some systems
# docker group gid and jenkins user uid
# have to match on both host and container
RUN usermod -a -G docker jenkins
RUN newgrp docker
USER jenkins


# lazy workaround: this will set jenkins user permissions on host side...
# USER root
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#     acl && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Afterwards inside a running container:
## setfacl -m user:jenkins:rw /var/run/docker.sock
## su jenkins