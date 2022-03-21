Exercícios - Sqoop – Importação BD Employees - Otimização

Sqoop - Importação BD Employees- Otimização

Realizar com uso do MySQL

## 1. Criar a tabela cp_titles_date, contendo a cópia da tabela titles com os campos title e to_date
1-Passo-Acessar o database

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker exec -it database bash

2-Passo-Acessar o mysql

root@database:/# mysql -psecret
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 44
Server version: 5.7.29 MySQL Community Server (GPL)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

3-Habilitar o shema employess;
mysql> use employees;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

4-Passo-Mostrar as tabelas; 
mysql> show tables;
+----------------------+
| Tables_in_employees  |
+----------------------+
| benefits             |
| current_dept_emp     |
| departments          |
| dept_emp             |
| dept_emp_latest_date |
| dept_manager         |
| employees            |
| employees_2          |
| titles               |
+----------------------+
9 rows in set (0.00 sec)

mysql>
 
5-Passo-Vê os campos da tabelasque será origem da cópia
mysql> select * from titles limit 3;
+--------+-----------------+------------+------------+
| emp_no | title           | from_date  | to_date    |
+--------+-----------------+------------+------------+
|  10001 | Senior Engineer | 1986-06-26 | 9999-01-01 |
|  10002 | Staff           | 1996-08-03 | 9999-01-01 |
|  10003 | Senior Engineer | 1995-12-03 | 9999-01-01 |
+--------+-----------------+------------+------------+
3 rows in set (0.00 sec)

## Resposta: 
mysql> mysql> create table cp_titles_date select title, to_date from titles;
Query OK, 443308 rows affected (3.50 sec)
Records: 443308  Duplicates: 0  Warnings: 0

# Para verificar
mysql> select * from cp_titles limit 3;
ERROR 1146 (42S02): Table 'employees.cp_titles' doesn't exist
mysql> select * from cp_titles_date limit 3;
+-----------------+------------+
| title           | to_date    |
+-----------------+------------+
| Senior Engineer | 9999-01-01 |
| Staff           | 9999-01-01 |
| Senior Engineer | 9999-01-01 |
+-----------------+------------+
3 rows in set (0.00 sec)

## 2. Pesquisar os 15 primeiros registros da tabela cp_titles_date
# Resposta:
mysql> select * from cp_titles_date limit 15;
+--------------------+------------+
| title              | to_date    |
+--------------------+------------+
| Senior Engineer    | 9999-01-01 |
| Staff              | 9999-01-01 |
| Senior Engineer    | 9999-01-01 |
| Engineer           | 1995-12-01 |
| Senior Engineer    | 9999-01-01 |
| Senior Staff       | 9999-01-01 |
| Staff              | 1996-09-12 |
| Senior Engineer    | 9999-01-01 |
| Senior Staff       | 9999-01-01 |
| Staff              | 1996-02-11 |
| Assistant Engineer | 2000-07-31 |
| Assistant Engineer | 1990-02-18 |
| Engineer           | 1995-02-18 |
| Senior Engineer    | 9999-01-01 |
| Engineer           | 9999-01-01 |
+--------------------+------------+
15 rows in set (0.00 sec)

## 3. Alterar os registros do campo to_date para null da tabela cp_titles_date, quando o título for igual a Staff
# Resposta
mysql> update cp_titles_date set to_date=NULL where title='Staff';
Query OK, 107391 rows affected (1.32 sec)
Rows matched: 107391  Changed: 107391  Warnings: 0

# Para verificar
mysql> select * from cp_titles_date limit 15;
+--------------------+------------+
| title              | to_date    |
+--------------------+------------+
| Senior Engineer    | 9999-01-01 |
| Staff              | NULL       |
| Senior Engineer    | 9999-01-01 |
| Engineer           | 1995-12-01 |
| Senior Engineer    | 9999-01-01 |
| Senior Staff       | 9999-01-01 |
| Staff              | NULL       |
| Senior Engineer    | 9999-01-01 |
| Senior Staff       | 9999-01-01 |
| Staff              | NULL       |
| Assistant Engineer | 2000-07-31 |
| Assistant Engineer | 1990-02-18 |
| Engineer           | 1995-02-18 |
| Senior Engineer    | 9999-01-01 |
| Engineer           | 9999-01-01 |
+--------------------+------------+
15 rows in set (0.00 sec)

mysql>

Obs: Sair do mysql 

Realizar com uso do Sqoop - Importações no warehouse /user/hive/warehouse/db_test_<numero_questao> e visualizar no HDFS

## 4. Importar a tabela titles com 8 mapeadores no formato parquet
1º Passo-Entrar no namenode
#Resposta:
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker exec -it namenode bash
root@namenode:/#  sqoop import --table titles --connect jdbc:mysql://database/employees --username root --password secret -m 8 --as-parquetfile --warehouse-dir /user/hive/warehouse/db_test2_c_4
Retorna:
Warning: /usr/lib/sqoop/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/lib/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Wa .....Continua.....

# Para verificar:
Atenção ERREI no nome db_test2_c_4 quando deveria ser db_test2_4.

Podemos verificar que foram criados 8 partições.no format parquet que é um formato binário.
Não é posível efetuar a leitura desse formato.  

@namenode:/# hdfs dfs -ls -h /user/hive/warehouse/db_test2_c_4
Found 1 items
drwxr-xr-x   - root supergroup          0 2022-02-17 08:53 /user/hive/warehouse/db_test2_c_4/titles
root@namenode:/# hdfs dfs -ls -h /user/hive/warehouse/db_test2_c_4/titles
Found 8 items
drwxr-xr-x   - root supergroup          0 2022-02-17 08:52 /user/hive/warehouse/db_test2_c_4/titles/.metadata
drwxr-xr-x   - root supergroup          0 2022-02-17 08:53 /user/hive/warehouse/db_test2_c_4/titles/.signals
-rw-r--r--   3 root supergroup    433.1 K 2022-02-17 08:53 /user/hive/warehouse/db_test2_c_4/titles/038f65a9-6328-4625-8ac1-237ed65383cc.parquet
-rw-r--r--   3 root supergroup    642.2 K 2022-02-17 08:53 /user/hive/warehouse/db_test2_c_4/titles/17804345-d7f3-4e24-b5a5-110c65afe2dd.parquet
-rw-r--r--   3 root supergroup    429.3 K 2022-02-17 08:53 /user/hive/warehouse/db_test2_c_4/titles/3920d1de-0b71-4c7a-81bb-9d614531232d.parquet
-rw-r--r--   3 root supergroup    581.7 K 2022-02-17 08:53 /user/hive/warehouse/db_test2_c_4/titles/3e727d9c-2e4d-4cde-9d59-16e62fbd20bd.parquet
-rw-r--r--   3 root supergroup    640.9 K 2022-02-17 08:53 /user/hive/warehouse/db_test2_c_4/titles/42b24778-36d5-42cc-95b4-12b5a00908ba.parquet
-rw-r--r--   3 root supergroup    491.0 K 2022-02-17 08:53 /user/hive/warehouse/db_test2_c_4/titles/d8338e0e-58e3-4ac0-b7d4-a454c8780097.parquet
root@namenode:/#

ten


## 5. Importar a tabela titles com 8 mapeadores no formato parquet e compressão snappy
# Resposta 
root@namenode:/#  sqoop import --table titles --connect jdbc:mysql://database/employees --username root --password secret -m 8 --as-parquetfile --warehouse-dir /user/hive/warehouse/db_test2_5 --compress --compression-codec org.apache.hadoop.io.compress.SnappyCodec

# Obs: Exibe o log na execução...

# Para verificar :
root@namenode:/# hdfs dfs -ls -h /user/hive/warehouse/db_test2_5
Found 1 items
drwxr-xr-x   - root supergroup          0 2022-02-17 09:13 /user/hive/warehouse/db_test2_5/titles
root@namenode:/# hdfs dfs -ls -h /user/hive/warehouse/db_test2_5/titles
Found 8 items
drwxr-xr-x   - root supergroup          0 2022-02-17 09:12 /user/hive/warehouse/db_test2_5/titles/.metadata
drwxr-xr-x   - root supergroup          0 2022-02-17 09:13 /user/hive/warehouse/db_test2_5/titles/.signals
-rw-r--r--   3 root supergroup    581.7 K 2022-02-17 09:13 /user/hive/warehouse/db_test2_5/titles/33320305-7b95-4d36-962a-1715d3aba72b.parquet
-rw-r--r--   3 root supergroup    433.1 K 2022-02-17 09:13 /user/hive/warehouse/db_test2_5/titles/625a1566-1e4c-4cab-aa03-e48c903c3f1c.parquet
-rw-r--r--   3 root supergroup    429.3 K 2022-02-17 09:13 /user/hive/warehouse/db_test2_5/titles/798625a4-b71f-4db4-9edb-1365c28e53b4.parquet
-rw-r--r--   3 root supergroup    642.2 K 2022-02-17 09:13 /user/hive/warehouse/db_test2_5/titles/8f271747-8cdc-484d-a67e-a7f35de8b9d9.parquet
-rw-r--r--   3 root supergroup    640.9 K 2022-02-17 09:13 /user/hive/warehouse/db_test2_5/titles/d122e6fa-1c21-4b96-8e7c-165c86c73166.parquet
-rw-r--r--   3 root supergroup    491.0 K 2022-02-17 09:13 /user/hive/warehouse/db_test2_5/titles/fa16ad37-a891-4aaa-8d2c-1b24fdc1eec1.parquet
root@namenode:/#

## 6. Importar a tabela cp_titles_date com 4 mapeadores (erro)
##  Resposta:
root@namenode:/#  sqoop import --table cp_title_date --connect jdbc:mysql://database/employees --username root --password secret -m 4 --warehouse-dir /user/hive/warehouse/db_test2_6
Warning: /usr/lib/sqoop/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/lib/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/lib/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/lib/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
22/02/17 09:27:12 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
22/02/17 09:27:12 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
22/02/17 09:27:12 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
22/02/17 09:27:12 INFO tool.CodeGenTool: Beginning code generation
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/hadoop-2.7.4/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/usr/lib/sqoop/lib/log4j-slf4j-impl-2.6.2.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Thu Feb 17 09:27:13 UTC 2022 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
22/02/17 09:27:23 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `cp_title_date` AS t LIMIT 1
22/02/17 09:27:24 ERROR manager.SqlManager: Error executing statement: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table 'employees.cp_title_date' doesn't exist
com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table 'employees.cp_title_date' doesn't exist
        at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
        at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
        at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
        at java.lang.reflect.Constructor.newInstance(Constructor.java:423)
        at com.mysql.jdbc.Util.handleNewInstance(Util.java:425)
        at com.mysql.jdbc.Util.getInstance(Util.java:408)
        at com.mysql.jdbc.SQLError.createSQLException(SQLError.java:944)
        at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:3978)
        at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:3914)
        at com.mysql.jdbc.MysqlIO.sendCommand(MysqlIO.java:2530)
        at com.mysql.jdbc.MysqlIO.sqlQueryDirect(MysqlIO.java:2683)
        at com.mysql.jdbc.ConnectionImpl.execSQL(ConnectionImpl.java:2495)
        at com.mysql.jdbc.PreparedStatement.executeInternal(PreparedStatement.java:1903)
        at com.mysql.jdbc.PreparedStatement.executeQuery(PreparedStatement.java:2011)
        at org.apache.sqoop.manager.SqlManager.execute(SqlManager.java:777)
        at org.apache.sqoop.manager.SqlManager.execute(SqlManager.java:786)
        at org.apache.sqoop.manager.SqlManager.getColumnInfoForRawQuery(SqlManager.java:289)
        at org.apache.sqoop.manager.SqlManager.getColumnTypesForRawQuery(SqlManager.java:260)
        at org.apache.sqoop.manager.SqlManager.getColumnTypes(SqlManager.java:246)
        at org.apache.sqoop.manager.ConnManager.getColumnTypes(ConnManager.java:327)
        at org.apache.sqoop.orm.ClassWriter.getColumnTypes(ClassWriter.java:1872)
        at org.apache.sqoop.orm.ClassWriter.generate(ClassWriter.java:1671)
        at org.apache.sqoop.tool.CodeGenTool.generateORM(CodeGenTool.java:106)
        at org.apache.sqoop.tool.ImportTool.importTable(ImportTool.java:501)
        at org.apache.sqoop.tool.ImportTool.run(ImportTool.java:628)
        at org.apache.sqoop.Sqoop.run(Sqoop.java:147)
        at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:70)
        at org.apache.sqoop.Sqoop.runSqoop(Sqoop.java:183)
        at org.apache.sqoop.Sqoop.runTool(Sqoop.java:234)
        at org.apache.sqoop.Sqoop.runTool(Sqoop.java:243)
        at org.apache.sqoop.Sqoop.main(Sqoop.java:252)
22/02/17 09:27:24 ERROR tool.ImportTool: Import failed: java.io.IOException: No columns to generate for ClassWriter
        at org.apache.sqoop.orm.ClassWriter.generate(ClassWriter.java:1677)
        at org.apache.sqoop.tool.CodeGenTool.generateORM(CodeGenTool.java:106)
        at org.apache.sqoop.tool.ImportTool.importTable(ImportTool.java:501)
        at org.apache.sqoop.tool.ImportTool.run(ImportTool.java:628)
        at org.apache.sqoop.Sqoop.run(Sqoop.java:147)
        at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:70)
        at org.apache.sqoop.Sqoop.runSqoop(Sqoop.java:183)
        at org.apache.sqoop.Sqoop.runTool(Sqoop.java:234)
        at org.apache.sqoop.Sqoop.runTool(Sqoop.java:243)
        at org.apache.sqoop.Sqoop.main(Sqoop.java:252)

root@namenode:/#

# Vamos listar as tabelas existnste como sqoop
root@namenode:/#  sqoop list-tables --connect jdbc:mysql://database/employees --username root --password secret
Warning: /usr/lib/sqoop/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/lib/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/lib/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/lib/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
22/02/17 10:20:56 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
22/02/17 10:20:57 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
22/02/17 10:20:57 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/hadoop-2.7.4/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/usr/lib/sqoop/lib/log4j-slf4j-impl-2.6.2.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Thu Feb 17 10:20:57 UTC 2022 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
benefits
cp_titles_date
current_dept_emp
departments
dept_emp
dept_emp_latest_date
dept_manager
employees
employees_2
titles
root@namenode:/#

## 3 Mesmo corrigindo o nome da tabela, ocorreu outro erro: 

## " 22/02/17 10:30:08 ERROR tool.ImportTool: Import failed: No primary key could be found for table cp_titles_date. Please specify one with --split-by or perform a sequential import with '-m 1'. " Isso ocorreu porque a tabela original tem um campo numerico sequencial e agora não tem.Ou seja a chave primario ou outro campo sequncial. 

root@namenode:/#  sqoop import --table cp_titles_date --connect jdbc:mysql://database/employees --username root --password secret -m 4 --warehouse-dir /user/hive/warehouse/db_test2_6
Warning: /usr/lib/sqoop/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/lib/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/lib/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/lib/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
22/02/17 10:29:00 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
22/02/17 10:29:01 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
22/02/17 10:29:04 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
22/02/17 10:29:04 INFO tool.CodeGenTool: Beginning code generation
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/hadoop-2.7.4/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/usr/lib/sqoop/lib/log4j-slf4j-impl-2.6.2.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Thu Feb 17 10:29:19 UTC 2022 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
22/02/17 10:29:21 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `cp_titles_date` AS t LIMIT 1
22/02/17 10:29:21 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `cp_titles_date` AS t LIMIT 1
22/02/17 10:29:21 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /opt/hadoop-2.7.4
Note: /tmp/sqoop-root/compile/1a3e7861548a1bfbc40cec2dfc198501/cp_titles_date.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
22/02/17 10:30:08 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-root/compile/1a3e7861548a1bfbc40cec2dfc198501/cp_titles_date.jar
22/02/17 10:30:08 WARN manager.MySQLManager: It looks like you are importing from mysql.
22/02/17 10:30:08 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
22/02/17 10:30:08 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
22/02/17 10:30:08 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
22/02/17 10:30:08 ERROR tool.ImportTool: Import failed: No primary key could be found for table cp_titles_date. Please specify one with --split-by or perform a sequential import with '-m 1'.
root@namenode:/#

## 6.2 Importar a tabela cp_titles_date com 4 mapeadores divididos pelo campo título no warehouse /user/hive/warehouse/db_test2_title

root@namenode:/#  sqoop import -Dorg.apache.sqoop.splitter.allow_text_splitter=true --table cp_titles_date --connect jdbc:mysql://database/employees --username root --password secret
-m 4 --warehouse-dir /user/hive/warehouse/db_test2_title --split-by title

Obs: Essa linha só foi preciso por causa da configuração do cluster, haverá caso quenão precisa.Durante a execução o sqoop informa se precisa ou  não. 

## Retorno:
...
                Bytes Written=9227831
22/02/17 10:46:54 INFO mapreduce.ImportJobBase: Transferred 22.8818 MB in 24.5927 seconds (952.7597 KB/sec)
22/02/17 10:46:54 INFO mapreduce.ImportJobBase: Retrieved 443308 records.
root@namenode:/#


## 6.3 Importar a tabela cp_titles_date com 4 mapeadores divididos pelo campo data no warehouse /user/hive/warehouse/db_test2_date
Resposta:
## root@namenode:/#  sqoop import -Dorg.apache.sqoop.splitter.allow_text_splitter=true --table cp_titles_date --connect jdbc:mysql://database/employees --username root --password secret -m 4 --warehouse-dir /user/hive/warehouse/db_test2_date --split-by to_date 


## Qual a diferença dos registros nulos entre as duas importações?
Vamos ver esse diretório?
root@namenode:/# hdfs dfs -count -h /user/hive/warehouse/db_test2_date
           2            5              7.7 M /user/hive/warehouse/db_test2_date
root@namenode:/#

listando melhor
root@namenode:/# hdfs dfs -ls -h -R /user/hive/warehouse/db_test2_date
drwxr-xr-x   - root supergroup          0 2022-02-17 11:01 /user/hive/warehouse/db_test2_date/cp_titles_date
-rw-r--r--   3 root supergroup          0 2022-02-17 11:01 /user/hive/warehouse/db_test2_date/cp_titles_date/_SUCCESS
-rw-r--r--   3 root supergroup      2.6 M 2022-02-17 11:01 /user/hive/warehouse/db_test2_date/cp_titles_date/part-m-00000
-rw-r--r--   3 root supergroup          0 2022-02-17 11:01 /user/hive/warehouse/db_test2_date/cp_titles_date/part-m-00001
-rw-r--r--   3 root supergroup          0 2022-02-17 11:01 /user/hive/warehouse/db_test2_date/cp_titles_date/part-m-00002
-rw-r--r--   3 root supergroup      5.1 M 2022-02-17 11:01 /user/hive/warehouse/db_test2_date/cp_titles_date/part-m-00003

o outro root@namenode:/# hdfs dfs -ls -h -R /user/hive/warehouse/db_test2_title
drwxr-xr-x   - root supergroup          0 2022-02-17 10:46 /user/hive/warehouse/db_test2_title/cp_titles_date
-rw-r--r--   3 root supergroup          0 2022-02-17 10:46 /user/hive/warehouse/db_test2_title/cp_titles_date/_SUCCESS
-rw-r--r--   3 root supergroup          0 2022-02-17 10:46 /user/hive/warehouse/db_test2_title/cp_titles_date/part-m-00000
-rw-r--r--   3 root supergroup    443.2 K 2022-02-17 10:46 /user/hive/warehouse/db_test2_title/cp_titles_date/part-m-00001
-rw-r--r--   3 root supergroup      2.2 M 2022-02-17 10:46 /user/hive/warehouse/db_test2_title/cp_titles_date/part-m-00002
-rw-r--r--   3 root supergroup        456 2022-02-17 10:46 /user/hive/warehouse/db_test2_title/cp_titles_date/part-m-00003
-rw-r--r--   3 root supergroup      5.8 M 2022-02-17 10:46 /user/hive/warehouse/db_test2_title/cp_titles_date/part-m-00004
-rw-r--r--   3 root supergroup    414.5 K 2022-02-17 10:46 /user/hive/warehouse/db_test2_title/cp_titles_date/part-m-00005
root@namenode:/#

root@namenode:/# hdfs dfs -count -h /user/hive/warehouse/db_test2_title
           2            7              8.8 M /user/hive/warehouse/db_test2_title
root@namenode:/#

Resposta: Isso ocorreu por causa dos campos NULL que uma tabela tem e a outra não.Não foi feito o balanceamento proporcioanal.

##### fALTA CONTINUAR NO MINUTO 25' ??????????

## 7. Clicar no botão de Enviar Tarefa, e enviar o texto: ok

 