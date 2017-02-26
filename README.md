# Window Linux Bash in Docker
Docker to run Linux bash command and utilities

docker compose command to show shell.
```
 docker build --build-arg user=rupisaini -t mybash . 
 docker run -v ${PWD}:/home/rupisaini -it --rm mybash
```


Other usefill docker commands
```
docker ps -a 
docker rm $(docker ps -a -q)
```

Commands to enable bash-it plugins and auto completion
```
bash-it enable plugin aws dirs git
bash-it enable completion dirs awscli git ssh projects terraform kubectl
```


If you are checking out more repositories may be remove or move .git folder