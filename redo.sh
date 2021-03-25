sudo docker rm my
sudo docker image rm im
sudo docker build -t im .
sudo docker run -it -p 443:443 -p 80:80 --name my im