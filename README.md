# Window Linux Bash in Docker
Docker to run Linux bash command and utilities

docker compose command to show shell.
```
 docker-compose run --rm bash
```


Other usefill docker commands
```
docker-compose build
docker ps -a 
docker rm $(docker ps -a -q)
```

```
RUN git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
./.bash_it/install.sh --silent
source .bashrc
bash-it enable plugin aws dirs git
bash-it enable completion dirs awscli git ssh projects terraform kubectl
```
