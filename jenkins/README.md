# Docker-in-Docker Jenkins

After Jenkins has taken its time starting up, check initial admin password from the container (or check the logs):

Check the password by running a command in the container (or use the VSCode docker extension):

```bash
# List running containers
docker-compose ps

# Execute command inside the container:
docker exec jenkins_docker:latest cat /var/jenkins_home/secrets/initialAdminPassword
```

Alternatively, attach a shell to the container:

```sh
docker exec -it jenkins_docker:latest bash
$ cat /var/jenkins_home/secrets/initialAdminPassword
```

After that, install the suggested plugins.