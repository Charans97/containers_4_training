## Getting Started

```sh
# Clone using SSH
git clone git@github.com:Charans97/containers_4_training.git
```
### Create the containers
```sh
docker compose up -d
```
### Verify if the containers are up

```
docker compose ps -a
```

### Access the nodes

```sh
docker compose exec -it <service name> bash

```

### Destroy the environment

```sh
docker compose down -v
```
