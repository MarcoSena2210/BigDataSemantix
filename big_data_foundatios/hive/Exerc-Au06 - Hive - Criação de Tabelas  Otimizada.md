

# Exercícios - Hive - Criação de Tabelas Otimizadas

* Nesse lab iremos usar a compressão dos dados tipo parquet.
Para isso é preciso criar outra table (pop_parquet) que deverá conter 
todas apenas as colunas que precisamos trabalhar.


## 1. Usar o banco de dados <nome>
 jdbc:hive2://localhost:10000><code> use marcosena;</code>

 Retorna:

 <prev>
No rows affected (0.066 seconds)
</prev>

## 2. Selecionar os 10 primeiros registros da tabela pop
0: jdbc:hive2://localhost:10000><code> select * from pop limit 10;</code>

Retorna:


<prev>
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
10 rows selected (0.223 seconds)
0: jdbc:hive2://localhost:10000>
</prev>

## 3. Criar a tabela pop_parquet no formato parquet para ler os dados da tabela pop
0: jdbc:hive2://localhost:10000><code> create table pop_parquet (
. . . . . . . . . . . . . . . .>  zip_code                 int,
. . . . . . . . . . . . . . . .>  total_population         int,
. . . . . . . . . . . . . . . .>  median_age               float,
. . . . . . . . . . . . . . . .>  total_males              int,
. . . . . . . . . . . . . . . .>  total_females            int,
. . . . . . . . . . . . . . . .>  total_households         int,
. . . . . . . . . . . . . . . .>  average_household_size   float
. . . . . . . . . . . . . . . .> ) stored as parquet;
</code>

Retorna:


<prev>
No rows affected (0.2 seconds)
0: jdbc:hive2://localhost:10000>
</prev>


## 4. Inserir os dados da tabela pop na pop_parquet
0: jdbc:hive2://localhost:10000><code> insert into pop_parquet select * from pop;</code>

Retorna:


<prev>
WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
No rows affected (4 seconds)
0: jdbc:hive2://localhost:10000>
</prev>


## 5. Contar os registros da tabela pop_parquet
0: jdbc:hive2://localhost:10000><code> select count(*) as qtd from pop_parquet;</code>

Retorna:


<prev>
+------+
| qtd  |
+------+
| 320  |
+------+
1 row selected (0.139 seconds)
</prev>

# Verificando se veio  a mesma quantidade de registro 
0: jdbc:hive2://localhost:10000><code> select count(*) as qtd from pop;</code>

Retorna:


<prev>

WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
+------+
| qtd  |
+------+
| 320  |
+------+
</prev>


## 6. Selecionar os 10 primeiros registros da tabela pop_parquet
0: jdbc:hive2://localhost:10000><code> select * from pop_parquet limit 10;</code>

Retorna

<prev>
+-----------------------+-------------------------------+-------------------------+--------------------------+----------------------------+-------------------------------+-------------------------------------+
| pop_parquet.zip_code  | pop_parquet.total_population  | pop_parquet.median_age  | pop_parquet.total_males  | pop_parquet.total_females  | pop_parquet.total_households  | pop_parquet.average_household_size  |
+-----------------------+-------------------------------+-------------------------+--------------------------+----------------------------+-------------------------------+-------------------------------------+
| NULL                  | NULL                          | NULL                    | NULL                     | NULL                       | NULL                          | NULL                                |
| 91371                 | 1                             | 73.5                    | 0                        | 1                          | 1                             | 1.0                                 |
| 90001                 | 57110                         | 26.6                    | 28468                    | 28642                      | 12971                         | 4.4                                 |
| 90002                 | 51223                         | 25.5                    | 24876                    | 26347                      | 11731                         | 4.36                                |
| 90003                 | 66266                         | 26.3                    | 32631                    | 33635                      | 15642                         | 4.22                                |
| 90004                 | 62180                         | 34.8                    | 31302                    | 30878                      | 22547                         | 2.73                                |
| 90005                 | 37681                         | 33.9                    | 19299                    | 18382                      | 15044                         | 2.5                                 |
| 90006                 | 59185                         | 32.4                    | 30254                    | 28931                      | 18617                         | 3.13                                |
| 90007                 | 40920                         | 24.0                    | 20915                    | 20005                      | 11944                         | 3.0                                 |
| 90008                 | 32327                         | 39.7                    | 14477                    | 17850                      | 13841                         | 2.33                                |
+-----------------------+-------------------------------+-------------------------+--------------------------+----------------------------+-------------------------------+-------------------------------------+
10 rows selected (0.218 seconds)
0: jdbc:hive2://localhost:10000>
</prev>

* Obs: 
Percebemos que existe registro null, ao tentar deletar com o comando abaixo, existe uma diretiva de segurança que não me permitiu.

* Como poderia excluir esse registro?

0: jdbc:hive2://localhost:10000><code> delete from pop_parquet where pop_parquet.zip_code = NULL;</code>

Retorno:
<prev>
Error: Error while compiling statement: FAILED: SemanticException [Error 10294]: Attempt to do update or delete using transaction manager that does not support these operations. (state=42000,code=10294)
0: jdbc:hive2://localhost:10000>
</prev>


## 7. Criar a tabela pop_parquet_snappy no formato parquet com compressão Snappy para ler os dados da tabela pop
* Nesse cluster não precisa setar nada: a saída da compressão,
setar a saida do map reduce para aceitar esse tipo.


0: jdbc:hive2://localhost:10000><code> create table pop_parquet_snappy (
. . . . . . . . . . . . . . . .> zip_code                 int,
. . . . . . . . . . . . . . . .> total_population         int,
. . . . . . . . . . . . . . . .> median_age               float,
. . . . . . . . . . . . . . . .> total_males              int,
. . . . . . . . . . . . . . . .> total_females            int,
. . . . . . . . . . . . . . . .> total_households         int,
. . . . . . . . . . . . . . . .> average_household_size   float
. . . . . . . . . . . . . . . .> )
. . . . . . . . . . . . . . . .> stored as parquet
. . . . . . . . . . . . . . . .> tblproperties('parquet.compress'='SNAPPY'); </code>

Retorna:
<prev>
No rows affected (0.111 seconds)
</prev>


# Vamos verificar como foi criada e observar o endereçõ de entrada e saida.
  SerDe Library:                | org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe | NULL               |
  InputFormat:                  | org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat | NULL             |
  OutputFormat:                 | org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat | NULL            | 


0: jdbc:hive2://localhost:10000><code> desc formatted pop_parquet_snappy; </code>

Retorna:


<prev> 
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
| CreateTime:                   | Wed Feb 16 08:47:04 UTC 2022                       | NULL                        |
| LastAccessTime:               | UNKNOWN                                            | NULL                        |
| Retention:                    | 0                                                  | NULL                        |
| Location:                     | hdfs://namenode:8020/user/hive/warehouse/marcosena.db/pop_parquet_snappy | NULL                        |
| Table Type:                   | MANAGED_TABLE                                      | NULL                        |
| Table Parameters:             | NULL                                               | NULL                        |
|                               | COLUMN_STATS_ACCURATE                              | {\"BASIC_STATS\":\"true\"}  |
|                               | numFiles                                           | 0                           |
|                               | numRows                                            | 0                           |
|                               | parquet.compress                                   | SNAPPY                      |
|                               | rawDataSize                                        | 0                           |
|                               | totalSize                                          | 0                           |
|                               | transient_lastDdlTime                              | 1645001224                  |
|                               | NULL                                               | NULL                        |
| # Storage Information         | NULL                                               | NULL                        |
| SerDe Library:                | org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe | NULL               |
| InputFormat:                  | org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat | NULL             |
| OutputFormat:                 | org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat | NULL            |
| Compressed:                   | No                                                 | NULL                        |
| Num Buckets:                  | -1                                                 | NULL                        |
| Bucket Columns:               | []                                                 | NULL                        |
| Sort Columns:                 | []                                                 | NULL                        |
| Storage Desc Params:          | NULL                                               | NULL                        |
|                               | serialization.format                               | 1                           |
+-------------------------------+----------------------------------------------------+-----------------------------+
37 rows selected (0.148 seconds)
0: jdbc:hive2://localhost:10000>
</prev>

## 8. Inserir os dados da tabela pop na pop_parquet_snappy
0: jdbc:hive2://localhost:10000><code> insert into pop_parquet_snappy select * from pop;</code>

Retorna:

<prev>
WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
No rows affected (2.571 seconds)

0: jdbc:hive2://localhost:10000>
</prev>

## 9. Contar os registros da tabela pop_parquet_snappy
0: jdbc:hive2://localhost:10000><code> select count(*) as qtd from pop_parquet_snappy;</code>

Retorna:


<prev>
+------+
| qtd  |
+------+
| 320  |
+------+
</prev>
## 10. Selecionar os 10 primeiros registros da tabela pop_parquet_snappy
: jdbc:hive2://localhost:10000><prev> select *  from pop_parquet_snappy limit 10;</prev>

Retorna:


<prev>
+------------------------------+--------------------------------------+--------------------------------+---------------------------------+-----------------------------------+--------------------------------------+--------------------------------------------+
| pop_parquet_snappy.zip_code  | pop_parquet_snappy.total_population  | pop_parquet_snappy.median_age  | pop_parquet_snappy.total_males  | pop_parquet_snappy.total_females  | pop_parquet_snappy.total_households  | pop_parquet_snappy.average_household_size  |
+------------------------------+--------------------------------------+--------------------------------+---------------------------------+-----------------------------------+--------------------------------------+--------------------------------------------+
| NULL                         | NULL                                 | NULL                           | NULL                            | NULL                              | NULL                                 | NULL                                       |
| 91371                        | 1                                    | 73.5                           | 0                               | 1                                 | 1                                    | 1.0                                        |
| 90001                        | 57110                                | 26.6                           | 28468                           | 28642                             | 12971                                | 4.4                                        |
| 90002                        | 51223                                | 25.5                           | 24876                           | 26347                             | 11731                                | 4.36                                       |
| 90003                        | 66266                                | 26.3                           | 32631                           | 33635                             | 15642                                | 4.22                                       |
| 90004                        | 62180                                | 34.8                           | 31302                           | 30878                             | 22547                                | 2.73                                       |
| 90005                        | 37681                                | 33.9                           | 19299                           | 18382                             | 15044                                | 2.5                                        |
| 90006                        | 59185                                | 32.4                           | 30254                           | 28931                             | 18617                                | 3.13                                       |
| 90007                        | 40920                                | 24.0                           | 20915                           | 20005                             | 11944                                | 3.0                                        |
| 90008                        | 32327                                | 39.7                           | 14477                           | 17850                             | 13841                                | 2.33                                       |
+------------------------------+--------------------------------------+--------------------------------+---------------------------------+-----------------------------------+--------------------------------------+--------------------------------------------+
10 rows selected (0.185 seconds)
</prev>

## 11. Comparar as tabelas pop, pop_parquet e pop_parquet_snappy no HDFS.
*  Podemos olhar o armazenamento no hdfs, (ctrl =D , ctrl + d)

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$<code> docker exec -it namenode bash</code>

Retorna:
<prev>
root@namenode:/#
</prev>

* Se é uma tabela interna, ela está no /hive/wherehouse

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$<code> docker exec -it namenode bash </code>

* listando  
root@namenode:/#<code> hdfs dfs -ls /user/hive/warehouse/marcosena.db </code>


Retorna:

<prev>
Found 3 items
drwxrwxr-x   - root supergroup          0 2022-02-15 02:09 /user/hive/warehouse/marcosena.db/pop
drwxrwxr-x   - root supergroup          0 2022-02-16 07:55 /user/hive/warehouse/marcosena.db/pop_parquet
drwxrwxr-x   - root supergroup          0 2022-02-16 08:57 /user/hive/warehouse/marcosena.db/pop_parquet_snappy
root@namenode:/#
</prev>

* Para vermos de forma reversa, dentro da tabela pop temos um arquivo populacaoLA.csv, os diretórios ../000000_0 são criado automaticamente, são chamados de buquet's 

root@namenode:/#<code> hdfs dfs -ls -R /user/hive/warehouse/marcosena.db </code>

Retorna:
<prev>
drwxrwxr-x   - root supergroup          0 2022-02-15 02:09 /user/hive/warehouse/marcosena.db/pop

-rwxrwxr-x   3 root supergroup      12503 2022-02-15 02:09 /user/hive/warehouse/marcosena.db/pop/populacaoLA.csv

drwxrwxr-x   - root supergroup          0 2022-02-16 07:55 /user/hive/warehouse/marcosena.db/pop_parquet

-rwxrwxr-x   3 root supergroup       9491 2022-02-16 07:55 /user/hive/warehouse/marcosena.db/pop_parquet/000000_0

drwxrwxr-x   - root supergroup          0 2022-02-16 08:57 /user/hive/warehouse/marcosena.db/pop_parquet_snappy

-rwxrwxr-x   3 root supergroup       9491 2022-02-16 08:57 /user/hive/warehouse/marcosena.db/pop_parquet_snappy/000000_0
root@namenode:/#

root@namenode:/# hdfs dfs -ls -R -h /user/hive/warehouse/marcosena.db

drwxrwxr-x   - root supergroup          0 2022-02-15 02:09 /user/hive/warehouse/marcosena.db/pop

-rwxrwxr-x   3 root supergroup     12.2 K 2022-02-15 02:09 /user/hive/warehouse/marcosena.db/pop/populacaoLA.csv

drwxrwxr-x   - root supergroup          0 2022-02-16 07:55 /user/hive/warehouse/marcosena.db/pop_parquet

-rwxrwxr-x   3 root supergroup      9.3 K 2022-02-16 07:55 /user/hive/warehouse/marcosena.db/pop_parquet/000000_0

drwxrwxr-x   - root supergroup          0 2022-02-16 08:57 /user/hive/warehouse/marcosena.db/pop_parquet_snappy

-rwxrwxr-x   3 root supergroup      9.3 K 2022-02-16 08:57 /user/hive/warehouse/marcosena.db/pop_parquet_snappy/000000_0
</prev>

* Aqui podemos ver o armazenamento.
root@namenode:/#<code> hdfs dfs -du -h /user/hive/warehouse/marcosena.db </code>

Retorna:


<prev>
12.2 K  /user/hive/warehouse/marcosena.db/pop


9.3 K   /user/hive/warehouse/marcosena.db/pop_parquet

9.3 K   /user/hive/warehouse/marcosena.db/pop_parquet_snappy
root@namenode:/#

</prev>

*Exemplo:
<prev>
create table pop_parquet_snappy (
zip_code                 int,
total_population         int,
median_age               float,
total_males              int,
total_females            int,
total_households         int,
average_household_size   float
) 
stored as parquet
tblproperties('parquet.compress'='SNAPPY');
</prev>