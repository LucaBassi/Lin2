# Lin



### Tunnel SSH Commands Sample
ssh -L 127.0.0.1:5000:192.168.50.10:22 debian@10.10.10.11  

ssh debian@10.0.0.10 -L 5001:192.168.50.10:22 -L 5002:192.168.50.20:22

ssh debian@127.0.0.1 -p 5000

### Docker
sudo apt install curl -y
curl -fsSL https://get.docker.com | sh

systemctl start docker
systemctl status docker

docker

sudo docker run -dit --name website1 -p 80:80 -v /var/www/website1/:/usr/local/apache2/htdocs/ httpd:2.4

sudo nano /var/www/website1/index.html

<p>Docker-Apache</p>

<b>Website </b>


sudo docker ps
#### Commandes docker


##### BUILD image 

docker build . -t datchos/tp2docker:v2 --no-cache


sudo docker stop myContainer
sudo docker rm myContainer
sudo docker image remove httpd:2.4
systemctl stop docker

#### Docker Compose
Vous connaissez maintenant les commandes principales pour utiliser une stack Docker Compose. Voici les commandes les plus importantes :

- **`docker-compose up -d`** vous permettra de démarrer l'ensemble des conteneurs en arrière-plan
- **`docker-compose ps`** vous permettra de voir le status de l'ensemble de votre stack
- **`docker-compose logs -f --tail 5`** vous permettra d'afficher les logs de votre stack
- **`docker-compose stop`** vous permettra d'arrêter l'ensemble des services d'une stack
- **`docker-compose down`** vous permettra de détruire l'ensemble des ressources d'une stack
- **`docker-compose config`** vous permettra de valider la syntaxe de votre fichier docker-compose.yml.

### Supprimer tous les container et volumes 
sudo docker rm -vf $(sudo docker ps -aq)

### Supprimer tous les images 
sudo docker rmi -f $(sudo docker images -aq)

## Docker HUB
https://docs.docker.com/docker-hub/repos/




ENV APACHE_DOCUMENT_ROOT /path/to/new/root

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf