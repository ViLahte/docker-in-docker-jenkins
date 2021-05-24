# Docker-in-Docker Jenkins
A repository for running Docker-in-Docker Jenkins locally.


After Jenkins has taken its time starting up, check the initial admin password:

```bash
docker-compose ps
docker exec jenkins_docker:latest cat /var/jenkins_home/secrets/initialAdminPassword
```

Alternatively, attach a shell to the container:

```sh
docker exec -it jenkins_docker:latest bash
$ cat /var/jenkins_home/secrets/initialAdminPassword
```

After that, proceed with the setup normally.
