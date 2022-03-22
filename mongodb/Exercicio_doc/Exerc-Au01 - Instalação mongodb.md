Exercícios - Instalação  


### 1.Instalação do docker e docker-compose
Acesso: https://docs.docker.com/get-docker/ (Links para um site externo.)
### 2.Baixar as imagens do mongo e mongo-express
Resposta

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata/meumongo$ ls 
Using default tag: latestcd 
latest: Pulling from library/mongo
08c01a0ec47e: Pull complete
ceb608a7cda7: Pull complete
a160d3e3934a: Pull complete
544b72923120: Pull complete
812461eda79e: Pull complete
3e1ac5db1dae: Pull complete
801c92a93fab: Pull complete
34e6068e2f4c: Pull complete
2513dc6d2ec7: Pull complete
d1ac55ebeb6f: Pull complete
Digest: sha256:c7f5b78eead63e672176d4a6e0932f8649c8f727dec5acef6b9ed7c9bdc3dae5
Status: Downloaded newer image for mongo:latest
docker.io/library/mongo:latest

mongo-express
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker pull mongo-express
Using default tag: latest
latest: Pulling from library/mongo-express
6a428f9f83b0: Pull complete
f2b1fb32259e: Pull complete
40888f2a0a1f: Pull complete
4e3cc9ce09be: Pull complete
eaa1898f3899: Pull complete
ab4078090382: Pull complete
ae780a42c79e: Pull complete
e60224d64a04: Pull complete
Digest: sha256:2a25aafdf23296823b06bc9a0a2af2656971262041b8dbf11b40444804fdc104
Status: Downloaded newer image for mongo-express:latest
docker.io/library/mongo-express:latest

### 3.Iniciar o MongoDB através do docker-compose

marco@DESKTOP-G2455QH:~/treinamentos/mongodb$ docker-compose up -d
Starting mongo         ... done
Starting mongo-express ... done


## Listando os serviços
marco@DESKTOP-G2455QH:~/treinamentos/mongodb$ docker ps -a

CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS              PORTS                                           NAMES
10e884dab62a   mongo-express   "tini -- /docker-ent…"   42 minutes ago   Up 58 seconds       0.0.0.0:8081->8081/tcp, :::8081->8081/tcp       mongo-express
87637f2ffe4b   mongo           "docker-entrypoint.s…"   42 minutes ago   Up About a minute   0.0.0.0:27017->27017/tcp, :::27017->27017/tcp   mongo

Startando o mongo db
marco@DESKTOP-G2455QH:~/treinamentos/mongodb$ docker-compose start

Starting mongo         ... done
Starting mongo-express ... done
marco@DESKTOP-G2455QH:~/treinamentos/mongodb$



## resposta
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata/mongodb$ docker-compose up -d
Retorna:
Creating network "mongodb_default" with the default driver
Creating volume "mongodb_db" with default driver
Creating mongo-express ... done
Creating mongo         ... done
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata/mongodb$

### 4.Listas as imagens em execução
marco@DESKTOP-G2455QH:~/treinamentos/mongodb$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
mongo                    latest    5285cb69ea55   2 weeks ago     698MB
mongo-express            latest    2d2fb2cabc8f   4 months ago    136MB
fjardim/jupyter-spark    latest    31051dea1e70   18 months ago   5.03GB
fjardim/datanode         latest    24fb187ebd91   23 months ago   874MB
fjardim/namenode_sqoop   latest    40dc59117765   23 months ago   1.54GB
fjardim/mysql            latest    84164b03fa2e   24 months ago   456MB
fjardim/hive-metastore   latest    7ab9e8f93813   24 months ago   275MB
fjardim/hive             latest    87f5c9f4e2df   4 years ago     1.17GB
fjardim/hbase-master     latest    ce0efeff9785   4 years ago     1.1GB
fjardim/zookeeper        latest    6fe5551964f5   6 years ago     451MB

### 5.Listar os bancos de dados do MongoDB
marco@DESKTOP-G2455QH:~/treinamentos/mongodb$ docker exec -it mongo ls
bin   dev                         home        lib32   media  proc  sbin  tmp
boot  docker-entrypoint-initdb.d  js-yaml.js  lib64   mnt    root  srv   usr
data  etc                         lib         libx32  opt    run   sys   var
marco@DESKTOP-G2455QH:~/treinamentos/mongodb$


marco@DESKTOP-G2455QH:~/treinamentos/mongodb$ docker exec -t mongo bash
root@87637f2ffe4b:/#


######################
marco@DESKTOP-G2455QH:~/treinamentos/mongodb$ docker exec -it mongo bash
root@87637f2ffe4b:/# ls
bin   data  docker-entrypoint-initdb.d  home        lib    lib64   media  opt   root  sbin  sys  usr
boot  dev   etc                         js-yaml.js  lib32  libx32  mnt    proc  run   srv   tmp  var

root@87637f2ffe4b:/# ls /data/
configdb  db

root@87637f2ffe4b:/# ls /data/db
Exibe:
WiredTiger         WiredTigerHS.wt                      collection-4-2301862272401654685.wt  index-5-2301862272401654685.wt  sizeStorer.wt
WiredTiger.lock    _mdb_catalog.wt                      diagnostic.data                      index-6-2301862272401654685.wt  storage.bson
WiredTiger.turtle  collection-0-2301862272401654685.wt  index-1-2301862272401654685.wt       journal
WiredTiger.wt      collection-2-2301862272401654685.wt  index-3-2301862272401654685.wt       mongod.lock
root@87637f2ffe4b:/# ## ACESSANDO O MONGO,INICIALIZANDO
root@87637f2ffe4b:/# mongo
MongoDB shell version v5.0.6
connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("d7528114-3d9e-4439-ac12-86cd46c57471") }
MongoDB server version: 5.0.6
================
Warning: the "mongo" shell has been superseded by "mongosh",
which delivers improved usability and compatibility.The "mongo" shell has been deprecated and will be removed in
an upcoming release.
For installation instructions, see
https://docs.mongodb.com/mongodb-shell/install/
================
Welcome to the MongoDB shell.
For interactive help, type "help".
For more comprehensive documentation, see
        https://docs.mongodb.com/
Questions? Try the MongoDB Developer Community Forums
        https://community.mongodb.com
---
The server generated these startup warnings when booting:
        2022-02-23T00:45:22.663+00:00: Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem
        2022-02-23T00:45:23.897+00:00: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
        2022-02-23T00:45:23.898+00:00: /sys/kernel/mm/transparent_hugepage/enabled is 'always'. We suggest setting it to 'never'
---
---
        Enable MongoDB's free cloud-based monitoring service, which will then receive and display
        metrics about your deployment (disk utilization, CPU, operation statistics, etc).

        The monitoring data will be available on a MongoDB website with a unique URL accessible to you
        and anyone you share the URL with. MongoDB may use this information to make product
        improvements and to suggest MongoDB products and deployment options to you.

        To enable free monitoring, run the following command: db.enableFreeMonitoring()
        To permanently disable this reminder, run the following command: db.disableFreeMonitoring()
---
>
Resposta 
> show dbs
admin   0.000GB
config  0.000GB
local   0.000GB
>

####################
dica para sair do mongo CTRL + D (Sai do mongo e volta para o terminal)
outro ctrl +D para sair do container

### 6.Visualizar através do Mongo Express os bancos de dados
Acesso: http://localhost:8081/




