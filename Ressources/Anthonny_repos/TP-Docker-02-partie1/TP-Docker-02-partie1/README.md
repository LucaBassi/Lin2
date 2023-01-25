# TP-Docker-02

## Run infrastructure
```bash
docker network create tp-docker-02
docker run -d -p 27017:27017 --name mongodb --net tp-docker-02 mongo:3.2
docker build . -t adieperi/tp2docker:v1 --no-cache
docker push adieperi/tp2docker:v1
docker run -p 5000:5000 --net tp-docker-02 --rm adieperi/tp2docker:v1
```
