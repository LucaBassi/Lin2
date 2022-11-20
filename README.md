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

sudo docker stop myContainer
sudo docker rm myContainer
sudo docker image remove httpd:2.4
systemctl stop docker