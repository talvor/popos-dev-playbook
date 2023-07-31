# Setup network services

## Setup Docker Swarm
### Setup nodes
Create an lxc container for each swarm node.  Once setup, run the following.
```shell
$ sudo apt-get update
$ sudo apt-get install ca-certificates curl gnupg
$ sudo install -m 0755 -d /etc/apt/keyrings
$ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
$ sudo chmod a+r /etc/apt/keyrings/docker.gpg
$ echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Setup swarm
On the manager node run the following

```shell
$ docker swarm init --advertise-addr 192.168.1.230
```

Copy the join token and then on each worker node run the following;

```shell
$ docker swarm join --token SWMTKN-1-1mdq916rfns2py1u4epyah7c719c99namrbaqpsfef3l8cpnay-4p69k6nr0zg42q7cd1nw8hg60 192.168.1.230:2377
```

## Copy setup to docker swarm manager
The following should be run from the `services` directory
```shell
$ scp -rp ./ root@docker.talvor.io:~/
```

## Setting up traefik
### Deploy stack
```shell
$ ssh root@docker.talvor.io
$ docker network create -d overlay traefik-public
$ export CF_API_KEY=<insert_cf_api_key> && docker stack deploy --compose-file ./traefik/traefik.yml traefik
```

## Setting up Portainer
### Deploy stack
```shell
$ ssh root@docker.talvor.io
$ docker stack deploy --compose-file ./portainer/portainer.yml portainer
```

## Setting up Whoami
### Deploy stack
```shell
$ ssh root@docker.talvor.io
$ docker stack deploy --compose-file ./whoami/whoami.yml whoami
```

## Setting up Gitlab
### Deploy stack
```shell
$ ssh root@docker.talvor.io
$ docker stack deploy --compose-file ./gitlab/gitlab-swarm.yml gitlab
```