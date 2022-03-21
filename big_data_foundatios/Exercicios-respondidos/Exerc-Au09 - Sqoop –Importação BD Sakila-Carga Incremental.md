Exercícios - Sqoop –Importação BD Sakila – Carga Incremental
Vencimento Sem prazo de entrega Pontos 0 Enviando uma caixa de entrada de texto
Sqoop - Importação BD Sakila – Carga Incremental

Realizar com uso do MySQL

## 1. Criar a tabela cp_rental_append, contendo a cópia da tabela rental com os campos rental_id e rental_date

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker exec -it database bash
root@database:/# mysql -psecret
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 90
Server version: 5.7.29 MySQL Community Server (GPL)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| employees          |
| hue                |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

mysql> show tables sakila;
ERROR 1046 (3D000): No database selected
mysql> use sakila;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+----------------------------+
| Tables_in_sakila           |
+----------------------------+
| actor                      |
| actor_info                 |
| address                    |
| category                   |
| city                       |
| country                    |
| customer                   |
| customer_list              |
| film                       |
| film_actor                 |
| film_category              |
| film_list                  |
| film_text                  |
| inventory                  |
| language                   |
| nicer_but_slower_film_list |
| payment                    |
| rental                     |
| sales_by_film_category     |
| sales_by_store             |
| staff                      |
| staff_list                 |
| store                      |
+----------------------------+
23 rows in set (0.00 sec)

mysql>



mysql> select * from rental limit 5;
+-----------+---------------------+--------------+-------------+---------------------+----------+---------------------+
| rental_id | rental_date         | inventory_id | customer_id | return_date         | staff_id | last_update         |
+-----------+---------------------+--------------+-------------+---------------------+----------+---------------------+
|         1 | 2005-05-24 22:53:30 |          367 |         130 | 2005-05-26 22:04:30 |        1 | 2006-02-15 21:30:53 |
|         2 | 2005-05-24 22:54:33 |         1525 |         459 | 2005-05-28 19:40:33 |        1 | 2006-02-15 21:30:53 |
|         3 | 2005-05-24 23:03:39 |         1711 |         408 | 2005-06-01 22:12:39 |        1 | 2006-02-15 21:30:53 |
|         4 | 2005-05-24 23:04:41 |         2452 |         333 | 2005-06-03 01:43:41 |        2 | 2006-02-15 21:30:53 |
|         5 | 2005-05-24 23:05:21 |         2079 |         222 | 2005-06-02 04:33:21 |        1 | 2006-02-15 21:30:53 |
+-----------+---------------------+--------------+-------------+---------------------+----------+---------------------+
5 rows in set (0.00 sec)

## Resposta: 
mysql> create table cp_rental_append select rental_id,rental_date from rental;
Query OK, 16044 rows affected (0.55 sec)
Records: 16044  Duplicates: 0  Warnings: 0

mysql> select * from cp_rental_append limit 5;
+-----------+---------------------+
| rental_id | rental_date         |
+-----------+---------------------+
|         1 | 2005-05-24 22:53:30 |
|         2 | 2005-05-24 22:54:33 |
|         3 | 2005-05-24 23:03:39 |
|         4 | 2005-05-24 23:04:41 |
|         5 | 2005-05-24 23:05:21 |
+-----------+---------------------+
5 rows in set (0.00 sec)



## 2 .Criar a tabela cp_rental_id e cp_rental_date, contendo a cópia da tabela cp_rental_append
Resposta 
create table cp_rental_id select * from cp_rental_append;
create table cp_rental_date select * from cp_rental_append;

### Varificando
 mysql> select * from cp_rental_date limit 5;
+-----------+---------------------+
| rental_id | rental_date         |
+-----------+---------------------+
|         1 | 2005-05-24 22:53:30 |
|         2 | 2005-05-24 22:54:33 |
|         3 | 2005-05-24 23:03:39 |
|         4 | 2005-05-24 23:04:41 |
|         5 | 2005-05-24 23:05:21 |
+-----------+---------------------+
5 rows in set (0.00 sec)

mysql> select * from cp_rental_id limit 5;
+-----------+---------------------+
| rental_id | rental_date         |
+-----------+---------------------+
|         1 | 2005-05-24 22:53:30 |
|         2 | 2005-05-24 22:54:33 |
|         3 | 2005-05-24 23:03:39 |
|         4 | 2005-05-24 23:04:41 |
|         5 | 2005-05-24 23:05:21 |
+-----------+---------------------+
5 rows in set (0.00 sec)


Realizar com uso do Sqoop - Importações no warehouse /user/hive/warehouse/db_test3 e visualizar no HDFS

## 3. Importar as tabelas cp_rental_append, cp_rental_id e cp_rental_date com 1 mapeador

## Resposta: 


arco@DESKTOP-G2455QH:/mnt/c/Windows/system32$ docker exec -it namenode bash

root@namenode:/# root@namenode:/#  sqoop import --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --table cp_rental_append

root@namenode:/# root@namenode:/#  sqoop import --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --table cp_rental_id

root@namenode:/# root@namenode:/#  sqoop import --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --table cp_rental_date

## Para verificar
root@namenode:/# hdfs dfs -ls -R /user/hive/warehouse/db_test3
drwxr-xr-x   - root supergroup          0 2022-02-17 21:47 /user/hive/warehouse/db_test3/cp_rental_append
-rw-r--r--   3 root supergroup          0 2022-02-17 21:47 /user/hive/warehouse/db_test3/cp_rental_append/_SUCCESS
-rw-r--r--   3 root supergroup     438131 2022-02-17 21:47 /user/hive/warehouse/db_test3/cp_rental_append/part-m-00000
drwxr-xr-x   - root supergroup          0 2022-02-17 21:50 /user/hive/warehouse/db_test3/cp_rental_date
-rw-r--r--   3 root supergroup          0 2022-02-17 21:50 /user/hive/warehouse/db_test3/cp_rental_date/_SUCCESS
-rw-r--r--   3 root supergroup     438131 2022-02-17 21:50 /user/hive/warehouse/db_test3/cp_rental_date/part-m-00000
drwxr-xr-x   - root supergroup          0 2022-02-17 21:45 /user/hive/warehouse/db_test3/cp_rental_id
-rw-r--r--   3 root supergroup          0 2022-02-17 21:45 /user/hive/warehouse/db_test3/cp_rental_id/_SUCCESS
-rw-r--r--   3 root supergroup     438131 2022-02-17 21:45 /user/hive/warehouse/db_test3/cp_rental_id/part-m-00000
root@namenode:/#

## Repare que os 3 tem o mesmo tamnaho
root@namenode:/# hdfs dfs -ls -h -R /user/hive/warehouse/db_test3
drwxr-xr-x   - root supergroup          0 2022-02-17 21:47 /user/hive/warehouse/db_test3/cp_rental_append
-rw-r--r--   3 root supergroup          0 2022-02-17 21:47 /user/hive/warehouse/db_test3/cp_rental_append/_SUCCESS
-rw-r--r--   3 root supergroup    427.9 K 2022-02-17 21:47 /user/hive/warehouse/db_test3/cp_rental_append/part-m-00000
drwxr-xr-x   - root supergroup          0 2022-02-17 21:50 /user/hive/warehouse/db_test3/cp_rental_date
-rw-r--r--   3 root supergroup          0 2022-02-17 21:50 /user/hive/warehouse/db_test3/cp_rental_date/_SUCCESS
-rw-r--r--   3 root supergroup    427.9 K 2022-02-17 21:50 /user/hive/warehouse/db_test3/cp_rental_date/part-m-00000
drwxr-xr-x   - root supergroup          0 2022-02-17 21:45 /user/hive/warehouse/db_test3/cp_rental_id
-rw-r--r--   3 root supergroup          0 2022-02-17 21:45 /user/hive/warehouse/db_test3/cp_rental_id/_SUCCESS
-rw-r--r--   3 root supergroup    427.9 K 2022-02-17 21:45 /user/hive/warehouse/db_test3/cp_rental_id/part-m-00000
root@namenode:/#

## Podemos verificar as ultimas informações inserids
root@namenode:/# hdfs dfs -tail  /user/hive/warehouse/db_test3/cp_rental_id/part-m-00000
2-14 15:16:03.0
13753,2006-02-14 15:16:03.0
11754,2006-02-14 15:16:03.0
13056,2006-02-14 15:16:03.0
14216,2006-02-14 15:16:03.0
15645,2006-02-14 15:16:03.0
13577,2006-02-14 15:16:03.0
15794,2006-02-14 15:16:03.0
11672,2006-02-14 15:16:03.0
12222,2006-02-14 15:16:03.0
11995,2006-02-14 15:16:03.0
13584,2006-02-14 15:16:03.0
12938,2006-02-14 15:16:03.0
14107,2006-02-14 15:16:03.0
12970,2006-02-14 15:16:03.0
13898,2006-02-14 15:16:03.0
13025,2006-02-14 15:16:03.0
11942,2006-02-14 15:16:03.0
11782,2006-02-14 15:16:03.0
11577,2006-02-14 15:16:03.0
13351,2006-02-14 15:16:03.0
12001,2006-02-14 15:16:03.0
12759,2006-02-14 15:16:03.0
14488,2006-02-14 15:16:03.0
12127,2006-02-14 15:16:03.0
13464,2006-02-14 15:16:03.0
14531,2006-02-14 15:16:03.0
13578,2006-02-14 15:16:03.0
14204,2006-02-14 15:16:03.0
15430,2006-02-14 15:16:03.0
14928,2006-02-14 15:16:03.0
15894,2006-02-14 15:16:03.0
13486,2006-02-14 15:16:03.0
15966,2006-02-14 15:16:03.0
11676,2006-02-14 15:16:03.0
14616,2006-02-14 15:16:03.0
11739,2006-02-14 15:16:03.0
root@namenode:/#

Realizar com uso do MySQL
 
## 4. Executar o sql /db-sql/sakila/insert_rental.sql no container do database
Esse arquivo sql vai atualizar nossas tabelas, para testar a carga incremental.
## 4.1-Vamos sair do namenode (ctr +d) e acessar o database
     marco@DESKTOP-G2455QH:/mnt/c/Windows/system32$ docker exec -it database bash
     root@database:/#
## 4.2-Ir para o diretório do sakila
     root@database:/# cd /db-sql/sakila/
     root@database:/db-sql/sakila#
## 4.3-Antes de executar o script, vamos verificar o que ele faz.  
    root@database:/db-sql/sakila# cat insert_rental.sql
    use sakila;
    DROP TABLE IF EXISTS cp_rental_append, cp_rental_date, cp_rental_id;
    create table cp_rental_append select rental_id, rental_date from rental;
    create table cp_rental_date select * from cp_rental_append;
    create table cp_rental_id select * from cp_rental_date;

    insert into cp_rental_date values(16048,'2005-08-23 22:30:00');
    insert into cp_rental_date values(16049,'2005-08-23 22:40:00');
    insert into cp_rental_date values(16050,'2005-08-23 22:52:50');
    insert into cp_rental_date values(16051,'2005-08-23 22:54:30');
    insert into cp_rental_date values(16052,'2005-08-23 22:55:20');
    insert into cp_rental_date values(16054,'2005-08-23 22:57:40');
    insert into cp_rental_date values(16053,'2005-08-23 22:56:10');
    insert into cp_rental_date values(16055,'2005-08-23 22:59:20');

    insert into cp_rental_id values(16048,'2005-08-23 22:30:00');
    insert into cp_rental_id values(16049,'2005-08-23 22:40:00');
    insert into cp_rental_id values(16050,'2005-08-23 22:52:50');
    insert into cp_rental_id values(16051,'2005-08-23 22:54:30');
    insert into cp_rental_id values(16052,'2005-08-23 22:55:20');
    insert into cp_rental_id values(16054,'2005-08-23 22:57:40');
    insert into cp_rental_id values(16053,'2005-08-23 22:56:10');
    insert into cp_rental_id values(16055,'2005-08-23 22:59:20');

    select * from cp_rental_date ORDER By cp_rental_date DESC limit 10;

    select * from cp_rental_id ORDER By cp_rental_date DESC limit 10;


    root@database:/db-sql/sakila#



$ docker exec -it database bash

$ cd /db-sql/sakila
## Para eecutar o script sql  
$ mysql -psecret < insert_rental.sql
 
root@database:/db-sql/sakila# mysql -psecret < insert_rental.sql
mysql: [Warning] Using a password on the command line interface can be insecure.
rental_id       rental_date
15458   2006-02-14 15:16:03
13421   2006-02-14 15:16:03
15542   2006-02-14 15:16:03
15294   2006-02-14 15:16:03
13428   2006-02-14 15:16:03
12988   2006-02-14 15:16:03
12786   2006-02-14 15:16:03
13952   2006-02-14 15:16:03
12574   2006-02-14 15:16:03
14915   2006-02-14 15:16:03
rental_id       rental_date
16055   2005-08-23 22:59:20
16054   2005-08-23 22:57:40
16053   2005-08-23 22:56:10
16052   2005-08-23 22:55:20
16051   2005-08-23 22:54:30
16050   2005-08-23 22:52:50
16049   2005-08-23 22:40:00
16049   2005-08-23 22:50:12
16048   2005-08-23 22:30:00
16048   2005-08-23 22:43:07
root@database:/db-sql/sakila#


Obs: Editor vi :
 com a seta navega pela tela 
 ui -> habilita o modo de inserção
 :wq -> salva e sai
 :q -> sai sem salvar         




###  Realizar com uso do Sqoop - Importações no warehouse /user/hive/warehouse/db_test3 e visualizar no HDFS

##  5. Atualizar a tabela cp_rental_append no HDFS anexando os novos arquivos
Na pasta docker-bigdata (Agora as tabelas tem novas informações)


# Acessa o namenode: 
marco@DESKTOP-G2455QH:/mnt/c/Windows/system32$ docker exec -it namenode bash
root@namenode:/#

Resposta: 
root@namenode:/#  sqoop import --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --table cp_rental_append

## Deu um erro porque já exist
22/02/17 23:31:46 ERROR tool.ImportTool: Import failed: org.apache.hadoop.mapred.FileAlreadyExistsException: Output directory hdfs://namenode:8020/user/hive/warehouse/db_test3/cp_rental_append already exists

## Para resolver, vamos informar que é para fazer o append
## Resposta
root@namenode:/#  sqoop import --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --table cp_rental_append --incremental append

Retorno 
Warning: /usr/lib/sqoop/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/lib/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
..Continua....

##  6. Atualizar a tabela cp_rental_id no HDFS de acordo com o último registro de rental_id, adicionando apenas os novos dados.

Para identificar, normalmente vc vai no hive, indeentifica o ultimo arquivo e depois o ultimo registro.Como teos uma tabela de referência podemos usar o eval do soop, para identificar.

Levantamento:

root@namenode:/#  sqoop eval --connect jdbc:mysql://database/sakila --username root --password secret --query "select * from cp_rental_append order by rental_id desc limit 5"
Warning: /usr/lib/sqoop/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/lib/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/lib/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/lib/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
22/02/17 23:58:35 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
22/02/17 23:58:35 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
22/02/17 23:58:35 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/hadoop-2.7.4/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/usr/lib/sqoop/lib/log4j-slf4j-impl-2.6.2.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Thu Feb 17 23:58:35 UTC 2022 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
-------------------------------------
| rental_id   | rental_date         |
-------------------------------------
| 16049       | 2005-08-23 22:50:12.0 |
| 16048       | 2005-08-23 22:43:07.0 |
| 16047       | 2005-08-23 22:42:48.0 |
| 16046       | 2005-08-23 22:26:47.0 |
| 16045       | 2005-08-23 22:25:26.0 |
-------------------------------------
root@namenode:/# 

## resposta 
root@namenode:/#  sqoop import --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --table cp_rental_id --incremental ap
pend --check-column rental_id --last-value 16049

Retorna 
Warning: /usr/lib/sqoop/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/lib/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
...Continua...


7. Atualizar a tabela cp_rental_date no HDFS de acordo com o último registro de rental_date, atualizando os registros a partir desta data.

(Qualquer dados que foi modificado após essa data )
root@namenode:/# sqoop import --table cp_rental_date --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1  --incremental lastmodified --merge-key rental_id --check-column rental_date --last-value '2005-08-23 22:50:12.0'


Retornou
....
             HDFS: Number of read operations=67
                HDFS: Number of large read operations=0
                HDFS: Number of write operations=23
        Map-Reduce Framework
                Map input records=16233
                Map output records=16233
                Map output bytes=638219
                Map output materialized bytes=670697
                Input split bytes=305
                Combine input records=0
                Combine output records=0
                Reduce input groups=16050
                Reduce shuffle bytes=670697
                Reduce input records=16233
                Reduce output records=16050
                Spilled Records=32466
                Shuffled Maps =2
                Failed Shuffles=0
                Merged Map outputs=2
                GC time elapsed (ms)=39
                Total committed heap usage (bytes)=1311768576
        Shuffle Errors
                BAD_ID=0
                CONNECTION=0
                IO_ERROR=0
                WRONG_LENGTH=0
                WRONG_MAP=0
                WRONG_REDUCE=0
        File Input Format Counters
                Bytes Read=443423
        File Output Format Counters
                Bytes Written=438299
22/02/18 01:08:43 INFO tool.ImportTool: Incremental import complete! To run another incremental import of all data following this import, supply the following arguments:
22/02/18 01:08:43 INFO tool.ImportTool:  --incremental lastmodified
22/02/18 01:08:43 INFO tool.ImportTool:   --check-column rental_date
22/02/18 01:08:43 INFO tool.ImportTool:   --last-value 2022-02-18 01:08:06.0
22/02/18 01:08:43 INFO tool.ImportTool: (Consider saving this with 'sqoop job --create')

## Vamos Listar para enteendermos cada uma delas 

root@namenode:/# hdfs dfs -ls -h -R /user/hive/warehouse/db_test3
drwxr-xr-x   - root supergroup          0 2022-02-17 23:40 /user/hive/warehouse/db_test3/cp_rental_append
-rw-r--r--   3 root supergroup          0 2022-02-17 21:47 /user/hive/warehouse/db_test3/cp_rental_append/_SUCCESS
-rw-r--r--   3 root supergroup    427.9 K 2022-02-17 21:47 /user/hive/warehouse/db_test3/cp_rental_append/part-m-00000
-rw-r--r--   3 root supergroup    427.9 K 2022-02-17 23:40 /user/hive/warehouse/db_test3/cp_rental_append/part-m-00001
drwxr-xr-x   - root supergroup          0 2022-02-18 01:08 /user/hive/warehouse/db_test3/cp_rental_date
-rw-r--r--   3 root supergroup          0 2022-02-18 01:08 /user/hive/warehouse/db_test3/cp_rental_date/_SUCCESS
-rw-r--r--   3 root supergroup    428.0 K 2022-02-18 01:08 /user/hive/warehouse/db_test3/cp_rental_date/part-r-00000
drwxr-xr-x   - root supergroup          0 2022-02-18 00:08 /user/hive/warehouse/db_test3/cp_rental_id
-rw-r--r--   3 root supergroup          0 2022-02-17 21:45 /user/hive/warehouse/db_test3/cp_rental_id/_SUCCESS
-rw-r--r--   3 root supergroup    427.9 K 2022-02-17 21:45 /user/hive/warehouse/db_test3/cp_rental_id/part-m-00000
-rw-r--r--   3 root supergroup        168 2022-02-18 00:08 /user/hive/warehouse/db_test3/cp_rental_id/part-m-00001
root@namenode:/#







Finalizado!!!


8. Clicar no botão de Enviar Tarefa, e enviar o texto: ok