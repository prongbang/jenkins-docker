# jenkins-docker

- Run

```shell
docker compose up -d
```

- Get admin password

```shell
docker exec jenkins-lts cat /var/jenkins_home/secrets/initialAdminPassword
```