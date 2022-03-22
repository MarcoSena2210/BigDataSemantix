
Mongo-express 

Se  usarmos o comando docker ps 
marco@DESKTOP-G2455QH:~/treinamentos/mongodb$ docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED      STATUS      PORTS                                           NAMES
10e884dab62a   mongo-express   "tini -- /docker-ent…"   4 days ago   Up 4 days   0.0.0.0:8081->8081/tcp, :::8081->8081/tcp       mongo-express
87637f2ffe4b   mongo           "docker-entrypoint.s…"   4 days ago   Up 4 days   0.0.0.0:27017->27017/tcp, :::27017->27017/tcp   mongo
marco@DESKTOP-G2455QH:~/treinamentos/mongodb$

Verificamos que temos instalado o mongo-express e que podemos acessá-lo via browse através da porta 8081.
Para isso basta digitar no browse : localhost:8081
 