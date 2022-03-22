# Exerc-Au01-Redis - Instalação


 ## 1 Baixar o redis na pasta treinamentos:
 <code>docker pull redis</code>
 
## 2 Copiar a imagem do serviço redis para pasta: treinamentos/redis   

 Obs: A imagem do serviço foi disponibilizada pelo treinamento da Semantix e baixada no ambiente windows

### Dica: Para copiar, na barra iniciar do windows digite <code>\\wsl$ </code>(irá abrir o ambiente linux.)


* Copie o arquivo: docker-compose.Yaml do windows para a pasta no \Ubuntu-20.04\home\ seu usuario no linux>\treinamentos\redis 


* Instalação do docker e docker-compose 
##### Docker:
https://docs.docker.com/get-docker/ (https://docs.docker.com/get-docker/)

##### Docker-compose:
https://docs.docker.com/compose/install/
(https://docs.docker.com/compose/install/)

## 1. Baixar a imagem do redis

marco@DESKTOP-G2455QH:~/treinamentos$
<code>docker pull redis</code>.

Retorna:
<pre>
Using default tag: latest
latest: Pulling from library/redis
f7a1c6dad281: Pull complete
c5f81eaec564: Pull complete
2be237d3defa: Pull complete
1640a11de2e5: Pull complete
9138edee9512: Pull complete
c62664237d8c: Pull complete
Digest: sha256:feb846600a248be6e6afbad39bf5b91afaef1de5524fd85b9b53839d0fd4af96
Status: Downloaded newer image for redis:latest
docker.io/library/redis:latest
marco@DESKTOP-G2455QH:~/treinamentos$
</pre>


## 3. Iniciar o Redis através do docker-compose
 
marco@DESKTOP-G2455QH:~/treinamentos$ <code> cd redis </code> 

* Indo para pasta que está a imagem do serviço e subindo o serviços no docker  

marco@DESKTOP-G2455QH:~/treinamentos/redis$ 

<code> docker-compose up -d </code> (Subindo o serviço)

Retorna:

<pre>
Creating network "redis_default" with the default driver
Creating volume "redis_data" with default driver
Creating redis ... done 
</pre>

## 4. Listas as imagens em execução

marco@DESKTOP-G2455QH:~/treinamentos/redis$ 
<code> docker ps </code> (exibe apenas os ativos)

Retorna: 
<pre>
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                       NAMES
07ca87c952c0   redis     "redis-server --appe…"   12 minutes ago   Up 12 minutes   0.0.0.0:6379->6379/tcp, :::6379->6379/tcp   redis
marco@DESKTOP-G2455QH:~/treinamentos/redis$
</pre>


## 5. Verificar a versão do Redis
marco@DESKTOP-G2455QH:~/treinamentos/redis$
* Server

<code> docker exec -it redis redis-server--version </code>

Retorna:
<pre>
Redis server v=6.2.6 sha=00000000:0 malloc=jemalloc-5.1.0 bits=64 build=683c7b62f604f53e
</pre>
 
* Client
marco@DESKTOP-G2455QH:~/treinamentos/redis$
#
<code> docker exec -it redis redis-cli --version</code>

Retorna
<pre>redis-cli 6.2.6 
marco@DESKTOP-G2455QH:~/treinamentos/redis$
</pre>

# 6. Acessar o Redis CLI
marco@DESKTOP-G2455QH:~/treinamentos/
<code>
redis$ docker exec -it redis bash </code>
root@07ca87c952c0:/data# <code>redis-cli </code>

Retorna:
 <pre>127.0.0.1:6379> </pre>

