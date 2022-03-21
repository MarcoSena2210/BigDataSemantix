
# Exercícios - Hive - Inserir Dados na Tabela Raw


* Nesse cenário, já existe o docker instalado e com todas as imagens dos serviços em que vamos usar,vamos acessar o hive através do beeline e iremos inserir dados.

* Esse material faz parte do aprendizado dispinível na vídeo aula do professor Rodrigo Rebousas, ministrado no curso de BIG DATA DA seamntix.



## 1.Visualizar a descrição da tabela pop do banco de dados <nome>
###### Primeiro vamos a iniciar o docker 
<code>docker-compose start</code>
* Depois vamos para o Hide Server 
<code>docker exec -it hive-server bash</code>
* Vamos verificar o nosso banco e as database criadas.Iremos usar o help do beeline para facilitar (beeline -help).Conectando o beeline

root@hive_server:/opt#
<code>beeline -u jdbc:hive2://localhost:10000</code>

Retorna:


<pre>
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
    0: jdbc:hive2://localhost:10000> 
 </pre>

* Verificando as bases existentes

0: jdbc:hive2://localhost:10000>
<code>show databases;</code>


Retorna:

<pre> 
+----------------+
| database_name  |
+----------------+
| default        |
| marcosena      |
+----------------+

2 rows selected (1.326 seconds)
0: jdbc:hive2://localhost:10000>

</pre>

* habilitar ou abrir nosso schema use marcosena(nesse caso e listar as tabelas)  

0: jdbc:hive2://localhost:10000> 
<code>use marcosena; <code>


<pre>No rows affected (0.049 seconds) </pre>

* Listando as tabelas

0: jdbc:hive2://localhost:10000>
<code> show tables; </code>

Retorna:

<pre>
+-----------+
| tab_name  |
+-----------+
| pop       |
+-----------+
1 row selected (0.068 seconds)
0: jdbc:hive2://localhost:10000>
</pre>

* Vamos precisar vê as nossa estrutura que pode ser feita de duas formas 

Forma 1

0: jdbc:hive2://localhost:10000><code> desc pop;</code>
<pre>
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
7 rows selected (0.102 seconds) 
</pre>

Forma 2
<pre>
0: jdbc:hive2://localhost:10000> desc formatted pop;
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
39 rows selected (0.184 seconds)
0: jdbc:hive2://localhost:10000>
</pre>


## 2.Selecionar os 10 primeiros registros da tabela pop

* Verificando que nossa tabela está vazia;

0:jdbc:hive2://localhost:10000><code>
 select * from pop limit 10;</code>

 Retorna:
 <prev> 
+---------------+-----------------------+-----------------+------------------+--------------------+-----------------------+-----------------------------+
| pop.zip_code  | pop.total_population  | pop.median_age  | pop.total_males  | pop.total_females  | pop.total_households  | pop.average_household_size  |
+---------------+-----------------------+-----------------+------------------+--------------------+-----------------------+-----------------------------+
+---------------+-----------------------+-----------------+------------------+--------------------+-----------------------+-----------------------------+
No rows selected (2.139 seconds)
0: jdbc:hive2://localhost:10000>
</pre>

Resposta

0:jdbc:hive2://localhost:10000><code> select * from pop limit 10;</code>

## 3.Carregar o arquivo do HDFS "/user/aluno/<nome>/data/população/populacaoLA.csv" para a tabela Hive pop


* 1º -Verificando se existe o arquivo no HDFS

root@namenode:/# <code>hdfs dfs -ls /user/aluno/marcosena/data/populacao </code>

Retorna:

<pre>
Found 1 items (encontrou)
-rw-r--r--   3 root supergroup      12503 2022-02-15 02:09 /user/aluno/marcosena/data/populacao/populacaoLA.csv
root@namenode:/#
<pre>

* 2-Carregando os dados 
 jdbc:hive2://localhost:10000> 
 <code>load data inpath '/user/aluno/marcosena/data/populacao' overwrite into table pop; </code>

 Retorna:

 <pre>
No rows affected (2.475 seconds)
0:jdbc:hive2://localhost:10000>  
</pre>

## 4.Selecionar os 10 primeiros registros da tabela pop

0:jdbc:hive2://localhost:10000><code> select * from pop limit 10;</code>

Retorna:

<pre>
+---------------+-----------------------+-----------------+------------------+--------------------+-----------------------+-----------------------------+
| pop.zip_code  | pop.total_population  | pop.median_age  | pop.total_males  | pop.total_females  | pop.total_households  | pop.average_household_size  |
+---------------+-----------------------+-----------------+------------------+--------------------+-----------------------+-----------------------------+
| NULL          | NULL                  | NULL            | NULL             | NULL               | NULL                  | NULL                        |
| 91371         | 1                     | 73.5            | 0                | 1                  | 1                     | 1.0                         |
| 90001         | 57110                 | 26.6            | 28468            | 28642              | 12971                 | 4.4                         |
| 90002         | 51223                 | 25.5            | 24876            | 26347              | 11731                 | 4.36                        |
| 90003         | 66266                 | 26.3            | 32631            | 33635              | 15642                 | 4.22                        |
| 90004         | 62180                 | 34.8            | 31302            | 30878              | 22547                 | 2.73                        |
| 90005         | 37681                 | 33.9            | 19299            | 18382              | 15044                 | 2.5                         |
| 90006         | 59185                 | 32.4            | 30254            | 28931              | 18617                 | 3.13                        |
| 90007         | 40920                 | 24.0            | 20915            | 20005              | 11944                 | 3.0                         |
| 90008         | 32327                 | 39.7            | 14477            | 17850              | 13841                 | 2.33                        |
+---------------+-----------------------+-----------------+------------------+--------------------+-----------------------+-----------------------------+
10 rows selected (0.459 seconds)
0:jdbc:hive2://localhost:10000>
<pre>

## 5.Contar a quantidade de registros da tabela pop

0:jdbc:hive2://localhost:10000>
<code> select count(*) from pop; </code>


Retorna:


<pre>
WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
+------+
| _c0  |
+------+
| 320  |
+------+
1 row selected (9.276 seconds)
0:jdbc:hive2://localhost:10000>
</pre>