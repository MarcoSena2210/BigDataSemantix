
# Exercícios - Criação de Tabela Raw


Nesse cenário, já existe o docker instalado e com todas as imagens dos seriços em que vamos usar,vamos acessar o hive através do beeline.

Esse material faz parte do aprendizado dispinível na vídeo aula do professor Rodrigo Rebousas, ministrado no curso de BIG DATA DA seamntix.

Essa tabela Raw ou tabela bruta é utilizado quando temos dados estruturado ou não estrurado como ".cvs" em nosso local e queremos enviar para hdfs para fazermos consultas.Da forma que estão.  

## 1. Enviar o arquivo local “/input/exercises-data/populacaoLA/populacaoLA.csv” para o diretório no HDFS “/user/aluno/<nome>/data/populacao”

# $ <b>docker-compose start</b> para subir nossos serviços:
arco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker-compose start
Starting namenode                  ... done
Starting datanode                  ... done
Starting hive-metastore-postgresql ... done
Starting hive-metastore            ... done
Starting hive-server               ... done
Starting database                  ... done
Starting zookeeper                 ... done
Starting hbase-master              ... done
Starting spark                     ... done
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$

# $ <b>docker exec -it namenode bash</b> Acessando onamenode 
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker exec -it namenode bash

root@namenode:/#

# $<b>  Verificado o que temos na pasta /input/exercises-data/populacaoLA/
root@namenode:/# ls /input/exercises-data/populacaoLA/
README.md  populacaoLA.csv  populacaoLA.json
root@namenode:/#

*Observamos que vamos precisar criar a pasta 
# Criamos a pasta /user/aluno/marcosena/data/populacao
root@namenode:/# hdfs dfs -mkdir /user/aluno/marcosena/data/populacao

# Vamos copiar a pasta para /user/aluno/marcosena/data/populacao
root@namenode:/# hdfs dfs -put /input/exercises-data/populacaoLA/populacaoLA.csv  /user/aluno/marcosena/data/populacao

# Vamos confirma se copiou
root@namenode:/# hdfs dfs -ls  /user/aluno/marcosena/data/populacao
Found 1 items
-rw-r--r--   3 root supergroup      12503 2022-02-15 02:09 /user/aluno/marcosena/data/populacao/populacaoLA.csv

# Vamos lê as 3primeiras linha para entender o que temos 
root@namenode:/# hdfs dfs -cat /user/aluno/marcosena/data/populacao/populacaoLA.csv | head -n 3
Zip Code,Total Population,Median Age,Total Males,Total Females,Total Households,Average Household Size
91371,1,73.5,0,1,1,1
90001,57110,26.6,28468,28642,12971,4.4
root@namenode:/# 

## 2. Listar os bancos de dados no Hive
# Preicsamos sair 
CTRL+D   (Saí do namenode e acrestou o exit)

root@namenode:/# exit
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$

# Precisamos 1º Acessar o hive server e usar o client beeline
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker exec -it hive-server bash
root@hive_server:/opt#

# Chamamos o help do beeline para facilitar a execução do comando.Só para copiar parte na conexão(beeline -u jdbc:hive2://localhost:10000)
root@hive_server:/opt# beeline --help  (crlt+l para ir para top da tela)

root@hive_server:/opt# beeline -u jdbc:hive2://localhost:10000
retorna 
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/hive/lib/log4j-slf4j-impl-2.6.2.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/opt/hadoop-2.7.4/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]
Connecting to jdbc:hive2://localhost:10000
Connected to: Apache Hive (version 2.3.2)
Driver: Hive JDBC (version 2.3.2)
Transaction isolation: TRANSACTION_REPEATABLE_READ
Beeline version 2.3.2 by Apache Hive
# Para verificar as tabelas 
0: jdbc:hive2://localhost:10000> show databases;
+----------------+
| database_name  |
+----------------+
| default        |
+----------------+
1 row selected (1.401 seconds)
0: jdbc:hive2://localhost:10000>

## 3. Criar o banco de dados <nome>
0: jdbc:hive2://localhost:10000> create database marcosena;
No rows affected (1.253 seconds)
0: jdbc:hive2://localhost:10000> show databases;
+----------------+
| database_name  |
+----------------+
| default        |
| marcosena      |
+----------------+
2 rows selected (0.039 seconds)
0: jdbc:hive2://localhost:10000>

## 4. Criar a Tabela Hive no BD <nome>

Tabela interna: pop
Campos:
zip_code - int
total_population - int
median_age - float
total_males - int
total_females - int
total_households - int
average_household_size - float
Propriedades
Delimitadores: Campo ‘,’ | Linha ‘\n’
Sem Partição
Tipo do arquivo: Texto
tblproperties("skip.header.line.count"="1")’


0: jdbc:hive2://localhost:10000> create table pop(
. . . . . . . . . . . . . . . .> zip_code int,
. . . . . . . . . . . . . . . .> total_population int,
. . . . . . . . . . . . . . . .> median_age float,
. . . . . . . . . . . . . . . .> total_males int,
. . . . . . . . . . . . . . . .> total_females int,
. . . . . . . . . . . . . . . .> total_households int,
. . . . . . . . . . . . . . . .> average_household_size float
. . . . . . . . . . . . . . . .> )
. . . . . . . . . . . . . . . .> row format delimited
. . . . . . . . . . . . . . . .> fields terminated by ','
. . . . . . . . . . . . . . . .> lines terminated by '\n'
. . . . . . . . . . . . . . . .> stored as textfile
. . . . . . . . . . . . . . . .> tblproperties("ship.header.line.count"="1");
No rows affected (0.583 seconds)
0: jdbc:hive2://localhost:10000>




## 5. Visualizar a descrição da tabela pop


0: jdbc:hive2://localhost:10000> desc pop;;
+-------------------------+------------+----------+
|        col_name         | data_type  | comment  |
+-------------------------+------------+----------+
| zip_code                | int        |          |
| total_population        | int        |          |
| median_age              | float      |          |
| total_males             | int        |          |
| total_females           | int        |          |
| total_households        | int        |          |
| average_household_size  | float      |          |
+-------------------------+------------+----------+


# ou  desc formatted  pop
0: jdbc:hive2://localhost:10000> desc formatted  pop;
+-------------------------------+----------------------------------------------------+-----------------------------+
|           col_name            |                     data_type                      |           comment           |
+-------------------------------+----------------------------------------------------+-----------------------------+
| # col_name                    | data_type                                          | comment                     |
|                               | NULL                                               | NULL                        |
| zip_code                      | int                                                |                             |
| total_population              | int                                                |                             |
| median_age                    | float                                              |                             |
| total_males                   | int                                                |                             |
| total_females                 | int                                                |                             |
| total_households              | int                                                |                             |
| average_household_size        | float                                              |                             |
|                               | NULL                                               | NULL                        |
| # Detailed Table Information  | NULL                                               | NULL                        |
| Database:                     | marcosena                                          | NULL                        |
| Owner:                        | root                                               | NULL                        |
| CreateTime:                   | Tue Feb 15 02:58:46 UTC 2022                       | NULL                        |
| LastAccessTime:               | UNKNOWN                                            | NULL                        |
| Retention:                    | 0                                                  | NULL                        |
| Location:                     | hdfs://namenode:8020/user/hive/warehouse/marcosena.db/pop | NULL                        |
| Table Type:                   | MANAGED_TABLE                                      | NULL                        |
| Table Parameters:             | NULL                                               | NULL                        |
|                               | COLUMN_STATS_ACCURATE                              | {\"BASIC_STATS\":\"true\"}  |
|                               | numFiles                                           | 0                           |
|                               | numRows                                            | 0                           |
|                               | rawDataSize                                        | 0                           |
|                               | ship.header.line.count                             | 1                           |
|                               | totalSize                                          | 0                           |
|                               | transient_lastDdlTime                              | 1644893926                  |
|                               | NULL                                               | NULL                        |
| # Storage Information         | NULL                                               | NULL                        |
| SerDe Library:                | org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe | NULL                        |
| InputFormat:                  | org.apache.hadoop.mapred.TextInputFormat           | NULL                        |
| OutputFormat:                 | org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat | NULL                        |
| Compressed:                   | No                                                 | NULL                        |
| Num Buckets:                  | -1                                                 | NULL                        |
| Bucket Columns:               | []                                                 | NULL                        |
| Sort Columns:                 | []                                                 | NULL                        |
| Storage Desc Params:          | NULL                                               | NULL                        |
|                               | field.delim                                        | ,                           |
|                               | line.delim                                         | \n                          |
|                               | serialization.format                               | ,                           |
+-------------------------------+----------------------------------------------------+-----------------------------+
39 rows selected (0.17 seconds)
0: jdbc:hive2://localhost:10000>

 