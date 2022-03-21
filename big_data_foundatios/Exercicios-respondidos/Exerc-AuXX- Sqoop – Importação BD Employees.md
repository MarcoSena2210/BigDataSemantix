### Exercícios - Sqoop – Importação BD Employees
Vencimento Sem prazo de entrega Pontos 0 Enviando uma caixa de entrada de texto
Sqoop - Importação BD Employees

## 1. Pesquisar os 10 primeiros registros da tabela employees do banco de dados employees
sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from employees limit 10"

root@namenode:/# sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from employees limit 10"

Warning: /usr/lib/sqoop/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/lib/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/lib/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/lib/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
22/02/17 00:38:43 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
22/02/17 00:38:43 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
22/02/17 00:38:43 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/hadoop-2.7.4/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/usr/lib/sqoop/lib/log4j-slf4j-impl-2.6.2.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Thu Feb 17 00:38:44 UTC 2022 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
---------------------------------------------------------------------------------
| emp_no      | birth_date | first_name     | last_name        | gender | hire_date  |
---------------------------------------------------------------------------------
| 10001       | 1953-09-02 | Georgi         | Facello          | M | 1986-06-26 |
| 10002       | 1964-06-02 | Bezalel        | Simmel           | F | 1985-11-21 |
| 10003       | 1959-12-03 | Parto          | Bamford          | M | 1986-08-28 |
| 10004       | 1954-05-01 | Chirstian      | Koblick          | M | 1986-12-01 |
| 10005       | 1955-01-21 | Kyoichi        | Maliniak         | M | 1989-09-12 |
| 10006       | 1953-04-20 | Anneke         | Preusig          | F | 1989-06-02 |
| 10007       | 1957-05-23 | Tzvetan        | Zielinski        | F | 1989-02-10 |
| 10008       | 1958-02-19 | Saniya         | Kalloufi         | M | 1994-09-15 |
| 10009       | 1952-04-19 | Sumant         | Peac             | F | 1985-02-18 |
| 10010       | 1963-06-01 | Duangkaew      | Piveteau         | F | 1989-08-24 |
---------------------------------------------------------------------------------
root@namenode:/#

## 2. Realizar as importações referentes a tabela employees e para validar cada questão,  é necessário visualizar no HDFS*

## a) Importar a tabela employees, no warehouse  /user/hive/warehouse/db_test_a

sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --warehouse-dir /user/hive/warehouse/db_test_a 

root@namenode:/# sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --warehouse-dir /user/hive/warehouse/db_test_a


Normalmente quando no final ele dá as info abaixo, é porque deu certo.
... # ulimos linhas após o comando.
22/02/17 00:53:53 INFO mapreduce.ImportJobBase: Transferred 33.0482 MB in 28.4262 seconds (1.1626 MB/sec)
22/02/17 00:53:53 INFO mapreduce.ImportJobBase: Retrieved 300024 records.
root@namenode:/#

# Conferido direto no hdsf 
hdfs dfs -ls /user/hive/warehouse/db_test_a/employees

root@namenode:/# hdfs dfs -ls /user/hive/warehouse/db_test_a/employees
Found 5 items
-rw-r--r--   3 root supergroup          0 2022-02-17 00:53 /user/hive/warehouse/db_test_a/employees/_SUCCESS
-rw-r--r--   3 root supergroup    4548041 2022-02-17 00:53 /user/hive/warehouse/db_test_a/employees/part-m-00000
-rw-r--r--   3 root supergroup    2550561 2022-02-17 00:53 /user/hive/warehouse/db_test_a/employees/part-m-00001
-rw-r--r--   3 root supergroup    2086360 2022-02-17 00:53 /user/hive/warehouse/db_test_a/employees/part-m-00002
-rw-r--r--   3 root supergroup    4637031 2022-02-17 00:53 /user/hive/warehouse/db_test_a/employees/part-m-00003
root@namenode:/#

Podemos observar que foram criados 4 partições ou diretórios. 
# Listando as 3 primeiras linhas da 1ª partição
hdfs dfs -cat /user/hive/warehouse/db_test_a/employees/part-m-00000 | head -n 3

root@namenode:/# hdfs dfs -cat /user/hive/warehouse/db_test_a/employees/part-m-00000 | head -n 3
Retorno:
10001,1953-09-02,Georgi,Facello,M,1986-06-26
10002,1964-06-02,Bezalel,Simmel,F,1985-11-21
10003,1959-12-03,Parto,Bamford,M,1986-08-28
cat: Unable to write to output stream.
root@namenode:/#

## b)Importar todos os funcionários do gênero masculino, no warehouse  /user/hive/warehouse/db_test_b

sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --where "gender='M'" --warehouse-dir /user/hive/warehouse/db_test_b 

root@namenode:/# sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --where "gender='M'" --warehouse-dir /user/hive/warehouse/db_test_b

22/02/17 01:30:01 INFO mapreduce.ImportJobBase: Transferred 19.8151 MB in 34.3399 seconds (590.8756 KB/sec)
22/02/17 01:30:01 INFO mapreduce.ImportJobBase: Retrieved 179973 records.
root@namenode:/#

# Listando paraconferir:

root@namenode:/# hdfs dfs -cat /user/hive/warehouse/db_test_b/employees/part-m-00000 | head -n 3

10001,1953-09-02,Georgi,Facello,M,1986-06-26
10003,1959-12-03,Parto,Bamford,M,1986-08-28
10004,1954-05-01,Chirstian,Koblick,M,1986-12-01
cat: Unable to write to output stream.
root@namenode:/#

root@namenode:/# hdfs dfs -ls -h  /user/hive/warehouse/db_test_b/employees/part-m-00000 | head -n 3 -
-rw-r--r--   3 root supergroup      2.6 M 2022-02-17 01:29 /user/hive/warehouse/db_test_b/employees/part-m-00000

root@namenode:/# hdfs dfs -ls -h  /user/hive/warehouse/db_test_b/employees
Found 5 items
-rw-r--r--   3 root supergroup          0 2022-02-17 01:30 /user/hive/warehouse/db_test_b/employees/_SUCCESS
-rw-r--r--   3 root supergroup      2.6 M 2022-02-17 01:29 /user/hive/warehouse/db_test_b/employees/part-m-00000
-rw-r--r--   3 root supergroup      1.5 M 2022-02-17 01:29 /user/hive/warehouse/db_test_b/employees/part-m-00001
-rw-r--r--   3 root supergroup      1.2 M 2022-02-17 01:29 /user/hive/warehouse/db_test_b/employees/part-m-00002
-rw-r--r--   3 root supergroup      2.7 M 2022-02-17 01:30 /user/hive/warehouse/db_test_b/employees/part-m-00003
root@namenode:/#



## c)importar o primeiro e o último nome dos funcionários com os campos separados por tabulação, no warehouse  /user/hive/warehouse/db_test_c
# Algo novo, vamos precisar as colunas, vamos dar um eval... para ver o nome dos campos.

root@namenode:/# sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from employees limit 10"
Warning: /usr/lib/sqoop/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/lib/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/lib/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/lib/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
22/02/17 01:40:59 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
22/02/17 01:40:59 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
22/02/17 01:40:59 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/hadoop-2.7.4/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/usr/lib/sqoop/lib/log4j-slf4j-impl-2.6.2.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Thu Feb 17 01:41:00 UTC 2022 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
---------------------------------------------------------------------------------
| emp_no      | birth_date | first_name     | last_name        | gender | hire_date  |
---------------------------------------------------------------------------------
| 10001       | 1953-09-02 | Georgi         | Facello          | M | 1986-06-26 |
| 10002       | 1964-06-02 | Bezalel        | Simmel           | F | 1985-11-21 |
| 10003       | 1959-12-03 | Parto          | Bamford          | M | 1986-08-28 |
| 10004       | 1954-05-01 | Chirstian      | Koblick          | M | 1986-12-01 |
| 10005       | 1955-01-21 | Kyoichi        | Maliniak         | M | 1989-09-12 |
| 10006       | 1953-04-20 | Anneke         | Preusig          | F | 1989-06-02 |
| 10007       | 1957-05-23 | Tzvetan        | Zielinski        | F | 1989-02-10 |
| 10008       | 1958-02-19 | Saniya         | Kalloufi         | M | 1994-09-15 |
| 10009       | 1952-04-19 | Sumant         | Peac             | F | 1985-02-18 |
| 10010       | 1963-06-01 | Duangkaew      | Piveteau         | F | 1989-08-24 |
---------------------------------------------------------------------------------


 sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --columns "first_name,last_name"  --fields-terminated-by '\t'--warehouse-dir /user/hive/warehouse/db_test_c

oot@namenode:/#  
sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --columns "first_name,last_name" --fields-terminated-by '\t' --warehouse-dir /user/hive/warehouse/db_test_c

Retorno final da execção:
22/02/17 01:52:23 INFO mapreduce.ImportJobBase: Transferred 11.068 MB in 24.766 seconds (457.627 KB/sec)
22/02/17 01:52:23 INFO mapreduce.ImportJobBase: Retrieved 300024 records.
root@namenode:/#

# Conferindo
root@namenode:/# hdfs dfs -ls -h  /user/hive/warehouse/db_test_c/employees
Found 5 items
-rw-r--r--   3 root supergroup          0 2022-02-17 01:52 /user/hive/warehouse/db_test_c/employees/_SUCCESS
-rw-r--r--   3 root supergroup      1.5 M 2022-02-17 01:52 /user/hive/warehouse/db_test_c/employees/part-m-00000
-rw-r--r--   3 root supergroup    825.7 K 2022-02-17 01:52 /user/hive/warehouse/db_test_c/employees/part-m-00001
-rw-r--r--   3 root supergroup    675.2 K 2022-02-17 01:52 /user/hive/warehouse/db_test_c/employees/part-m-00002
-rw-r--r--   3 root supergroup      1.5 M 2022-02-17 01:52 /user/hive/warehouse/db_test_c/employees/part-m-00003
root@namenode:/#

## d)Importar o primeiro e o último nome dos funcionários com as linhas separadas por “ : ” e salvar no mesmo diretório da questão 2.C

### Como esse dire´torio ja existe irá dar um erro se tentarmos importar para o mesmo diretório.Não podemos fazer um append pois os campos são os mesmos. A melhor alternativa é deletar o anteiro.  

sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --columns "first_name,last_name" --lines-terminated-by ':' --warehouse-dir /user/hive/warehouse/db_test_c -delete-target-dir

3 ultimas linhas de retorno: 
22/02/17 02:08:23 INFO mapreduce.ImportJobBase: Transferred 11.068 MB in 21.6802 seconds (522.7625 KB/sec)
22/02/17 02:08:23 INFO mapreduce.ImportJobBase: Retrieved 300024 records.
root@namenode:/#

* Dica para visualizar no HDFS:

$ hdfs dfs -cat /user/hive/warehouse/db_test_c/employees/part-m-00000 | head -n 5
### Parte dos dados de retorno:
nneli,Hagimont:Sudhanshu,Besancenot:Pranav,Terkki:Lihong,Ossenbruggen:Wayne,Strandh:Surveyors,Chorvat:Masaki,Skafidas:Goncalo,Stenning:Jaewon,Strehl:Masami,Waterhouse:Jeanna,Ferretti:Bernd,Thombley:Matt,Siochi:Filipp,Sanella:Narain,Granlund:Lihong,Rouquie:Mihalis,Facello:Richara,Trogemann:Troy,Schrift:Lene,Itzigehl:Rildo,Puppo:Shuji,Botman:Peer,Vidal:Xinyu,Validov:Marsha,Velasco:Sumali,Menhoudj:Ohad,Lakshmanan:Fan,Binkley:Ewing,Murtagh:Hatem,Kroll:Nimmagadda,Bail:Radhakrishnan,Papastamatiou:Shounak,Hemaspaandra:Marsja,Wendorf:Vishu,Perez:Ramya,Walston:Arfst,Beetstra:Sungwon,Ladret:Janalee,Gaughan:Waiman,Cherinka:Uwe,Merle:Shounak,Naumovich:Nikolaus,Ghandeharizadeh:Sibyl,Gyimothy:Teunis,McClure:Idoia,Gulak:Szabolcs,Papadias:Krister,Hettesheimer:Shaowen,Takkinen:Vidar,Ashish:Kazuhide,Conti:Leah,Norsworthy:Gretta,Suomi:Hideyuki,Mansanne:Jenwei,Akaboshi:Xiaoqiu,Asmuth:Hitofumi,Sundgren:Kolar,Weed.....