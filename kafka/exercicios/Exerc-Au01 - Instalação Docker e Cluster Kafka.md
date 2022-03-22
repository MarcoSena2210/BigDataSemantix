# Exerc-Au01 - Instalação Docker e Cluster Kafka

Dica: Dentro da pasta treinamentos, criaremos uma pasta kafka, detro dela iremos colocar o arquivo com a image do serviço kafka para o dokker o arquivo xxxx.
disponibiblizado pela SEMANTIX.

No caso do Windows foi feito da seguinte forma:


## 1. Criar a pasta kafka e inserir o arquivo docker-compose.yml da Guia Arquivos do treinamento


a)-Fiz o download do arquivo para um pasta no ambiente windows;

B)-No menu iniciar do windos digitei> \\wsl$  (Abre o explorer com a visão das pastas no ambiente linux)

C)-Clique em: Ubuntu-20.04\home\<seu usuário no linux>\treinamentos\kafka 

d)-copie o arquivo  docker-compose.yml do Windows para o linux (CTRL+C e na pasta treinamento/kafka CRL+V )


## 2. Instalação do docker e docker-compose
Não se aplica nomeu caso, pois já tinha instalado anteriormente.

Docker: https://docs.docker.com/get-docker/ (Links para um site externo.)
Docker-compose: https://docs.docker.com/compose/install/ (Links para um site externo.)

## 3. Inicializar o cluster Kafka através do docker-compose

marco@DESKTOP-G2455QH:~/treinamentos/kafka$ 
doker-compose up -d 

Dica: podemos listar todas imagens

marco@DESKTOP-G2455QH:~/treinamentos/kafka$ docker images

REPOSITORY                                  TAG           IMAGE ID       CREATED         SIZE
mongo                                       latest        5285cb69ea55   4 weeks ago     698MB
mongo-express                               latest        2d2fb2cabc8f   4 months ago    136MB
confluentinc/cp-kafka-rest                  5.5.2         6a349b76caaf   4 months ago    1.22GB
confluentinc/cp-schema-registry             5.5.2         bf1991bb16ca   4 months ago    1.26GB
confluentinc/cp-enterprise-control-center   5.5.2         517d392d3335   4 months ago    958MB
confluentinc/cp-server                      5.5.2         cdb294a5890e   4 months ago    1.05GB
confluentinc/cp-zookeeper                   5.5.2         8899b084ef3b   4 months ago    666MB
confluentinc/ksqldb-examples                5.5.2         d739ab13f1da   17 months ago   630MB
confluentinc/cp-ksqldb-server               5.5.2         cb294553b9ec   17 months ago   663MB
confluentinc/cp-ksqldb-cli                  5.5.2         cd82f01891f7   17 months ago   647MB
fjardim/jupyter-spark                       latest        31051dea1e70   18 months ago   5.03GB
cnfldemos/cp-server-connect-datagen         0.3.2-5.5.0   8b1a9577099c   22 months ago   1.53GB
fjardim/datanode                            latest        24fb187ebd91   23 months ago   874MB
fjardim/namenode_sqoop                      latest        40dc59117765   23 months ago   1.54GB
fjardim/mysql                               latest        84164b03fa2e   24 months ago   456MB
fjardim/hive-metastore                      latest        7ab9e8f93813   2 years ago     275MB
fjardim/hive                                latest        87f5c9f4e2df   4 years ago     1.17GB
fjardim/hbase-master                        latest        ce0efeff9785   4 years ago     1.1GB
fjardim/zookeeper                           latest        6fe5551964f5   6 years ago     451MB 

## 4. Listas as imagens em execução
marco@DESKTOP-G2455QH:~/treinamentos/kafka$ docker ps
CONTAINER ID   IMAGE                             COMMAND                  CREATED       STATUS       PORTS                                                                                  NAMES
a85053ed6207   confluentinc/cp-server:5.5.2      "/etc/confluent/dock…"   6 hours ago   Up 6 hours   0.0.0.0:9092->9092/tcp, :::9092->9092/tcp, 0.0.0.0:9101->9101/tcp, :::9101->9101/tcp   broker
00f176400044   confluentinc/cp-zookeeper:5.5.2   "/etc/confluent/dock…"   6 hours ago   Up 6 hours   2888/tcp, 0.0.0.0:2181->2181/tcp, :::2181->2181/tcp, 3888/tcp                          zookeeper
10e884dab62a   mongo-express                     "tini -- /docker-ent…"   8 days ago    Up 3 days    0.0.0.0:8081->8081/tcp, :::8081->8081/tcp                                              mongo-express
87637f2ffe4b   mongo                             "docker-entrypoint.s…"   8 days ago    Up 3 days    0.0.0.0:27017->27017/tcp, :::27017->27017/tcp                                          mongo

marco@DESKTOP-G2455QH:~/treinamentos/kafka$


## 5. Visualizar o log dos serviços broker e zookeeper
marco@DESKTOP-G2455QH:~/treinamentos/kafka$ docker logs broker
marco@DESKTOP-G2455QH:~/treinamentos/kafka$ docker logs zookeeper

Dica: verificar visualmente se ocorreu algum erro.Geralmente vamos trabalhar na port  2181.Se houver outro serviço usando essa porta podedar conflito.

[2022-03-03 16:44:05,149] INFO binding to port 0.0.0.0/0.0.0.0:2181 (org.apache.zookeeper.server.NIOServerCnxnFactory)
[2022-03-03 16:44:05,174] INFO zookeeper.s 

## 6. Visualizar a interface do Confluent Control Center

Acesso: http://localhost:9021/ (Links para um site externo.)
## 7. Clicar no botão de Enviar Tarefa, e enviar o texto: ok