# Exerc-Aula02-spark Preparar os dados e o ambiente

## 1.Configurar o jar do spark para aceitar o formato parquet em tabelas Hive

curl O https://repo1.maven.org/maven2/com/twitter/parquet hadoop
bundle/1.6.0/parquet hadoop bundle 1.6.0.jar

docker cp parquet hadoop bundle 1.6.0.jar jupyter spark:/opt/spark/jars


marco@DESKTOP-G2455QH:~/treinamentos/spark$ <code> sudo curl -O https://repo1.maven.org/maven2/com/twitter/parquet-hadoop-bundle/1.6.0/parquet-hadoop-bundle-1.6.0.ja
r </code>
Exibe:

<prev>

[sudo] password for marco:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 2731k  100 2731k    0     0  1888k      0  0:00:01  0:00:01 --:--:-- 1888k

<prev>

* Listando as pastas:
marco@DESKTOP-G2455QH:~/treinamentos/spark$ ls -la
total 3120
drwxr-xr-x  5 root  root     4096 Apr  5 13:36 .
drwxr-xr-x  9 marco marco    4096 Apr  4 22:02 ..
drwxr-xr-x  8 root  root     4096 Apr  4 22:03 .git
-rwxr-xr-x  1 root  root     3443 Apr  4 22:03 README.md
drwxr-xr-x 16 root  root     4096 Apr  4 22:40 data
-rw-r--r--  1 root  root     6755 Apr  4 22:03 docker-compose-completo-windows.yml
-rw-r--r--  1 root  root     6381 Apr  4 22:03 docker-compose-completo.yml
-rw-r--r--  1 root  root     5172 Apr  4 22:03 docker-compose-parcial.yml
-rwxr-xr-x  1 root  root     3778 Apr  4 22:03 docker-compose.yml
-rw-r--r--  1 root  root   343678 Apr  4 22:03 ecosystem.jpeg
drwxr-xr-x  2 root  root     4096 Apr  4 22:40 input
-rw-r--r--  1 root  root  2796935 Apr  5 13:36 parquet-hadoop-bundle-1.6.0.jar

* Copinado o aquivo baixado para pasta do spark 

marco@DESKTOP-G2455QH:~/treinamentos/spark$ 

<code> 
docker cp parquet-hadoop-bundle-1.6.0.jar jupyter-spark:/opt/spark/jars 
</code>
marco@DESKTOP-G2455QH:~/treinamentos/spark$


## 2.Baixar os dados dos exercícios do treinamento no diretório spark/input (volume no
Namenode)

cd input
•
sudo git clone https://github.com/rodrigo reboucas/exercises data.git .

marco@DESKTOP-G2455QH:~/treinamentos/spark$ <code> cd input </code>
marco@DESKTOP-G2455QH:~/treinamentos/spark/input$ <code> sudo git clone https://github.com/rodrigo-reboucas/exercises-data.git .
</code> 
Exibe:

<prev>
Cloning into '.'...
remote: Enumerating objects: 311, done.
remote: Total 311 (delta 0), reused 0 (delta 0), pack-reused 311
Receiving objects: 100% (311/311), 88.96 MiB | 7.58 MiB/s, done.
Resolving deltas: 100% (17/17), done.
Updating files: 100% (283/283), done.
marco@DESKTOP-G2455QH:~/treinamentos/spark/input$
</prev>

## 3.Verificar o envio dos dados para o namenode

marco@DESKTOP-G2455QH:~/treinamentos/spark/input$<code> docker exec -it namenode ls /input </code>
Exibe:
<prev>
README.md       economicFitness  escola       map.py        populacaoLA
WordCount.java  empreendimento   hnpStats     names         reduce.py
beneficio       entrada1.txt     iris         namesbystate
db-sql          entrada2.txt     juros_selic  ouvidoria
marco@DESKTOP-G2455QH:~/treinamentos/spark/input$
</prev>

## 4.Criar no hdfs a seguinte estrutura: /user/marco/data

* Chamando o namenode e listando a pasta input:

marco@DESKTOP-G2455QH:~/treinamentos/spark/input$ docker exec -it namenode ls /input
README.md       economicFitness  escola       map.py        populacaoLA
WordCount.java  empreendimento   hnpStats     names         reduce.py
beneficio       entrada1.txt     iris         namesbystate
db-sql          entrada2.txt     juros_selic  ouvidoria


* Executando o namenode:

marco@DESKTOP-G2455QH:~/treinamentos/spark/input$ docker exec -it namenode bash

* Listando
root@namenode:/# ls /input/
README.md       beneficio  economicFitness  entrada1.txt  escola    iris         map.py  namesbystate  populacaoLA
WordCount.java  db-sql     empreendimento   entrada2.txt  hnpStats  juros_selic  names   ouvidoria     reduce.py

* Vendo o que tem na hdfs:

root@namenode:/#<code>  hdfs dfs -ls /user </code>
Exibe:
<prev>
Found 1 items
drwxr-xr-x   - root supergroup          0 2022-04-05 01:41 /user/hive
root@namenode:/#
</prev>

root@namenode:/# <code> hdfs dfs -mkdir -p /user/marco/data </code>

## 5.Enviar todos os dados do diretório input para o hdfs em /user/marco/data

root@namenode:/#<code> hdfs dfs -put  /input/* /user/marco/data </code>


* Verificando se copiou:

root@namenode:/# <code> hdfs dfs -ls /user/marco/data </code>
<prev>
Found 18 items
-rw-r--r--   3 root supergroup         46 2022-04-05 17:10 /user/marco/data/README.md
-rw-r--r--   3 root supergroup       2089 2022-04-05 17:10 /user/marco/data/WordCount.java
drwxr-xr-x   - root supergroup          0 2022-04-05 17:10 /user/marco/data/beneficio
drwxr-xr-x   - root supergroup          0 2022-04-05 17:11 /user/marco/data/db-sql
drwxr-xr-x   - root supergroup          0 2022-04-05 17:11 /user/marco/data/economicFitness
drwxr-xr-x   - root supergroup          0 2022-04-05 17:11 /user/marco/data/empreendimento
-rw-r--r--   3 root supergroup         54 2022-04-05 17:11 /user/marco/data/entrada1.txt
-rw-r--r--   3 root supergroup         42 2022-04-05 17:11 /user/marco/data/entrada2.txt
drwxr-xr-x   - root supergroup          0 2022-04-05 17:11 /user/marco/data/escola
drwxr-xr-x   - root supergroup          0 2022-04-05 17:11 /user/marco/data/hnpStats
drwxr-xr-x   - root supergroup          0 2022-04-05 17:11 /user/marco/data/iris
drwxr-xr-x   - root supergroup          0 2022-04-05 17:11 /user/marco/data/juros_selic
-rw-r--r--   3 root supergroup        161 2022-04-05 17:11 /user/marco/data/map.py
drwxr-xr-x   - root supergroup          0 2022-04-05 17:11 /user/marco/data/names
drwxr-xr-x   - root supergroup          0 2022-04-05 17:12 /user/marco/data/namesbystate
drwxr-xr-x   - root supergroup          0 2022-04-05 17:12 /user/marco/data/ouvidoria
drwxr-xr-x   - root supergroup          0 2022-04-05 17:12 /user/marco/data/populacaoLA
-rw-r--r--   3 root supergroup        511 2022-04-05 17:12 /user/marco/data/reduce.py
root@namenode:/# hdfs dfs -put  /input/* /user/marco/data
</prev>