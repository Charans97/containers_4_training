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

### Generate ssh key in ansible node 

```sh
ssh-keygen -t rsa -b 4096
```

### Exit ansible node and run this to add ssh keys in authorized keys for all other nodes
```sh
chmod +x ssh.sh
./ssh.sh
```

### Destroy the environment(once everything is done)

```sh
docker compose down -v
```
