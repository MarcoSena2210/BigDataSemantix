

# Exercícios - Hive - Criação de Tabela Particionada

## 1. Criar o diretório “/user/aluno/<nome>/data/nascimento” no HDFS

Dica:
* No namenode temos dois sitema de arquivos o local e o HDFS


* Listando o diretório local

arco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ 
<code>docker exec -it namenode ls /</code> 

Retorna:

<prev>
alunos.json  dev             hadoop       lib           mnt   run     sys
bin          employees.java  hadoop-data  lib64         opt   run.sh  tmp
boot         entrypoint.sh   home         media         proc  sbin    usr
derby.log    etc             input        metastore_db  root  srv     var
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$
</prev>

*  Listando o diretório HDFS

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$<code> docker exec -it namenode hdfs dfs -ls /</code>

Retorna:

<prev>
Found 3 items

drwxr-xr-x   - root supergroup          0 2022-02-15 08:42 /hbase

drwxrwxr-x   - root supergroup          0 2022-02-12 00:00 /tmp

drwxr-xr-x   - root supergroup          0 2022-02-13 13:58 /user
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$
</prev>

# Criando o diretório do exercício

Amarco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$<code>docker exec -it namenode hdfs dfs -mkdir /user/aluno/marcosena/data/nascimento
</code>

* Listando para conferir se foi criado corretamente

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$<code> docker exec -it namenode hdfs dfs -ls /user/aluno/marcosena/data/</code>

Retorna:

<prev>Found 3 items

drwxr-xr-x   - root supergroup          0 2022-02-13 15:22 /user/aluno/marcosena/data/escola

drwxr-xr-x   - root supergroup          0 2022-02-15 16:12 /user/aluno/marcosena/data/nascimento

-rw-r--r--   2 root supergroup          0 2022-02-13 15:50 /user/aluno/marcosena/data/test

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$
</prev>

## 2. Criar e usar o Banco de dados <nome>

* Obs já tinha sido criado.No exercício anterior.

## 3. Criar uma tabela externa no Hive com os parâmetros:
Obs: Aqui, não compensa fazer por aqui, porque vamos precisar usar o beeline.

Precisamos acessar o hive-server:
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker exec -it hive-server bash
root@hive_server:/opt#

# Acessando o beeline 

root@hive_server:/opt# <code>beeline -u jdbc:hive2://localhost:10000</code>

Retorna:

<prev>
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


* Mostrandoas os bancos 
0: jdbc:hive2://localhost:10000> 
<code>show databases; </code>

Retorna:

<prev>
+----------------+
| database_name  |
+----------------+
| default        |
| marcosena      |
+----------------+
</prev>

2 rows selected (0.315 seconds)


0: jdbc:hive2://localhost:10000><code> USE MARCOSENA;</code>

Retorna:

<prev>
No rows affected (0.08 seconds)
</prev>

0: jdbc:hive2://localhost:10000><code> use marcosena;</code>

Retorna:

No rows affected (0.045 seconds)

0: jdbc:hive2://localhost:10000><code> desc tables;</code>

Retorna:

<prev>
Error: Error while compiling statement: FAILED: SemanticException [Error 10001]: Table not found tables (state=42S02,code=10001)
</prev>

* Mostrando as tabelas
0: jdbc:hive2://localhost:10000><code> show tables;</code>

Retorna:

<prev>
+-----------+
| tab_name  |
+-----------+
| pop       |
+-----------+
1 row selected (0.062 seconds)
</prev>

0: jdbc:hive2://localhost:10000>

# a) Tabela: nascimento
# b) Campos: nome (String), sexo (String) e frequencia (int)
# c) Partição: ano
# d) Delimitadores:
# i) Campo ‘,’
# ii)  Linha ‘\n’
# e) Salvar
# i) Tipo do arquivo: texto
# ii) HDFS: '/user/aluno/<nome>/data/nascimento’

0: jdbc:hive2://localhost:10000> 
<code>show databases;</code>

Retorna:

+----------------+
| database_name  |
+----------------+
| default        |
| marcosena      |
+----------------+
2 rows selected (0.315 seconds)

0: jdbc:hive2://localhost:10000>

* Vamos abri nosso "schema de banco"

: jdbc:hive2://localhost:10000><code> use marcosena; </code>

Retorna:
<prev>
No rows affected (0.045 seconds)
</prev>
* Vamos listar nossas tabelas
0
: jdbc:hive2://localhost:10000> <code>  show tables; </code>
<prev>
+-----------+
| tab_name  |
+-----------+
| pop       |
+-----------+
1 row selected (0.062 seconds)
0: jdbc:hive2://localhost:10000>
</prev>

a) Tabela: nascimento

* Atenção: 
A coluna que está na partição não pode está na tabela.A partição será um diretório.
Essa tabela guarda as criancas e a quantidade de nascimento de cada criança no ano (mesmo nome) 


* Obs: 
Quando estava criando a tabela o hive travou e ao tentar sair de alguma foi criado errada tabela,mesmo dando um drop table nascimento e recriando de forma correta, não foi o suficiente para sobrepor o metadados anterior.     

1 row selected (0.07 seconds)

0: jdbc:hive2://localhost:10000><code> create external table nascimento(
. . . . . . . . . . . . . . . .> nome string, sexo string,frequencia int)
. . . . . . . . . . . . . . . .> partitioned by (ano int)
. . . . . . . . . . . . . . . .> row format delimited
. . . . . . . . . . . . . . . .> fields terminated by ','
. . . . . . . . . . . . . . . .> lines  terminated by '\n'
. . . . . . . . . . . . . . . .> stored as textfile
. . . . . . . . . . . . . . . .> location'/user/aluno/marcosena/data/nascimento';
No rows affected (0.137 seconds)
</code>

0: jdbc:hive2://localhost:10000><code>show tables;</code>
<prev>
+-------------+
|  tab_name   |
+-------------+
| nascimento  |
| pop         |
+-------------+
2 rows selected (0.066 seconds)
</prev>

0: jdbc:hive2://localhost:10000><code> desc nascimento; </code>
+--------------------------+-----------------------+-----------------------+
|         col_name         |       data_type       |        comment        |
+--------------------------+-----------------------+-----------------------+
| nome                     | string                |                       |
| sexo                     | string                |                       |
| frequencia               | int                   |                       |
| ano                      | int                   |                       |
|                          | NULL                  | NULL                  |
| # Partition Information  | NULL                  | NULL                  |
| # col_name               | data_type             | comment               |
|                          | NULL                  | NULL                  |
| ano                      | int                   |                       |
+--------------------------+-----------------------+-----------------------+


* Vou tentar um reparar, pravê o que acontece.
0: jdbc:hive2://localhost:10000><code> msck repair table nascimento; </code>

Retornou:
No rows affected (0.359 seconds)
* Aceitou mas não resolvel.

* Diante desse fato e do tempo para entrega das tarefas vou criar a tabela com outro nome:

## nascimento1

0: jdbc:hive2://localhost:10000><code> create external table nascimento(
. . . . . . . . . . . . . . . .> nome string, sexo string,frequencia int)
. . . . . . . . . . . . . . . .> partitioned by (ano int)
. . . . . . . . . . . . . . . .> row format delimited
. . . . . . . . . . . . . . . .> fields terminated by ','
. . . . . . . . . . . . . . . .> lines  terminated by '\n'
. . . . . . . . . . . . . . . .> stored as textfile
. . . . . . . . . . . . . . . .> location'/user/aluno/marcosena/data/nascimento';

: jdbc:hive2://localhost:10000> desc nascimento1;
+--------------------------+-----------------------+-----------------------+
|         col_name         |       data_type       |        comment        |
+--------------------------+-----------------------+-----------------------+
| nome                     | string                |                       |
| sexo                     | string                |                       |
| frequencia               | int                   |                       |
| ano                      | int                   |                       |
|                          | NULL                  | NULL                  |
| # Partition Information  | NULL                  | NULL                  |
| # col_name               | data_type             | comment               |
|                          | NULL                  | NULL                  |
| ano                      | int                   |                       |
+--------------------------+-----------------------+-----------------------+
9 rows selected (0.138 seconds)

</code>

b) Campos: nome (String), sexo (String) e frequencia (int)

c) Partição: ano

d) Delimitadores:

i) Campo ‘,’

ii)  Linha ‘\n’

e) Salvar

## 1. Tipo do arquivo: texto
## 2. HDFS: '/user/aluno/<nome>/data/nascimento’

## 4.Adicionar partição ano=2015
jdbc:hive2://localhost:10000><code> alter table nascimento add partition(ano=2015);
</code>

## 5.Enviar o arquivo local “input/exercises-data/names/yob2015.txt” para o HDFS no diretório /user/aluno/<nome>/data/nascimento/ano=2015

* Obs:
 Verificando o que tem nesta tabela : <code>Select * from nascimento; </code> 

0: jdbc:hive2://localhost:10000><code> select * from nascimento; </code>
<table>
+------------------+------------------+------------------------+-----------------+
| nascimento.nome  | nascimento.sexo  | nascimento.frequencia  | nascimento.ano  |
+------------------+------------------+------------------------+-----------------+
+------------------+------------------+------------------------+-----------------+
</Table>
No rows selected (5.099 seconds)


* Vamos sair do beeline (ctrl + D ) E SAIR DO HIVE (ctrl + d) e acessar o namenode para listar a pasta 

* Acessando o namenode: 
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$<code> docker exec -it namenode bash </code>

* listando o diretório para verificarmos se foi criada a pasta 

root@namenode:/#<code> hdfs dfs -ls /user/aluno/marcosena/data/nascimento</code>

Found 1 items
Retorna:

drwxr-xr-x   - root supergroup          0 2022-02-15 23:47 /user/aluno/marcosena/data/nascimento/ano=2015
root@namenode:/#

* listando a pasta dos arquivos contendo os nomes
root@namenode:/#<code> ls /input/exercises-data/names</code>


Retorna:

<prev>
NationalReadMe.pdf  yob1895.txt  yob1911.txt  yob1927.txt  yob1943.txt  yob1959.txt  yob1975.txt  yob1991.txt  yob2007.txt
yob1880.txt         yob1896.txt  yob1912.txt  yob1928.txt  yob1944.txt  yob1960.txt  yob1976.txt  yob1992.txt  yob2008.txt
yob1881.txt         yob1897.txt  yob1913.txt  yob1929.txt  yob1945.txt  yob1961.txt  yob1977.txt  yob1993.txt  yob2009.txt
yob1882.txt         yob1898.txt  yob1914.txt  yob1930.txt  yob1946.txt  yob1962.txt  yob1978.txt  yob1994.txt  yob2010.txt
yob1883.txt         yob1899.txt  yob1915.txt  yob1931.txt  yob1947.txt  yob1963.txt  yob1979.txt  yob1995.txt  yob2011.txt
yob1884.txt         yob1900.txt  yob1916.txt  yob1932.txt  yob1948.txt  yob1964.txt  yob1980.txt  yob1996.txt  yob2012.txt
yob1885.txt         yob1901.txt  yob1917.txt  yob1933.txt  yob1949.txt  yob1965.txt  yob1981.txt  yob1997.txt  yob2013.txt
yob1886.txt         yob1902.txt  yob1918.txt  yob1934.txt  yob1950.txt  yob1966.txt  yob1982.txt  yob1998.txt  yob2014.txt
yob1887.txt         yob1903.txt  yob1919.txt  yob1935.txt  yob1951.txt  yob1967.txt  yob1983.txt  yob1999.txt  yob2015.txt
yob1888.txt         yob1904.txt  yob1920.txt  yob1936.txt  yob1952.txt  yob1968.txt  yob1984.txt  yob2000.txt  yob2016.txt
yob1889.txt         yob1905.txt  yob1921.txt  yob1937.txt  yob1953.txt  yob1969.txt  yob1985.txt  yob2001.txt  yob2017.txt
yob1890.txt         yob1906.txt  yob1922.txt  yob1938.txt  yob1954.txt  yob1970.txt  yob1986.txt  yob2002.txt
yob1891.txt         yob1907.txt  yob1923.txt  yob1939.txt  yob1955.txt  yob1971.txt  yob1987.txt  yob2003.txt
yob1892.txt         yob1908.txt  yob1924.txt  yob1940.txt  yob1956.txt  yob1972.txt  yob1988.txt  yob2004.txt
yob1893.txt         yob1909.txt  yob1925.txt  yob1941.txt  yob1957.txt  yob1973.txt  yob1989.txt  yob2005.txt
yob1894.txt         yob1910.txt  yob1926.txt  yob1942.txt  yob1958.txt  yob1974.txt  yob1990.txt  yob2006.txt
</prev>

# Enviando o arquivo...para a pasta destino

 root@namenode:/# <code>hdfs dfs -put /input/exercises-data/names/yob2015.txt /user/aluno/marcosena/data/nascimento/ano=2015 </code>

* Agora vamos voltar para o beeline e 

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$<code> docker exec -it namenode bash </code>

root@namenode:/#<code> beeline -u  jdbc:hive2://localhost:10000 </code>

Retornou:

<prev> bash: beeline: command not found
</prev>

* Saindo...
root@namenode:/# <code>exit </code>

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$<code> docker exec -it hive-server bash </code>

root@hive_server:/opt#<code> beeline -u jdbc:hive2://localhost:10000 </code>

Retorna:
<prev>
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
</prev
>
* fazer o select novamente
: jdbc:hive2://localhost:10000><code> select * from marcosena.nascimento;</code>

## 6.Selecionar os 10 primeiros registros da tabela nascimento no Hive
0: jdbc:hive2://localhost:10000><code> select * from marcosena.nascimento limit 10;</code>

Retorna:
<prev>
+------------------+------------------+------------------------+-----------------+
| nascimento.nome  | nascimento.sexo  | nascimento.frequencia  | nascimento.ano  |
+------------------+------------------+------------------------+-----------------+
| Emma             | F                | 20435                  | 2015            |
| Olivia           | F                | 19669                  | 2015            |
| Sophia           | F                | 17402                  | 2015            |
| Ava              | F                | 16361                  | 2015            |
| Isabella         | F                | 15594                  | 2015            |
| Mia              | F                | 14892                  | 2015            |
| Abigail          | F                | 12390                  | 2015            |
| Emily            | F                | 11780                  | 2015            |
| Charlotte        | F                | 11390                  | 2015            |
| Harper           | F                | 10291                  | 2015            |
+------------------+------------------+------------------------+-----------------+
10 rows selected (0.302 seconds)

0: jdbc:hive2://localhost:10000>
</prev>

## 7.Repita o processo do 4 ao 6 para os anos de 2016 e 2017.

# Abrindo o conexão 
0: jdbc:hive2://localhost:10000><code> use marcosena;</code>

No rows affected (0.065 seconds)

# Criando a partição 2016 e 2017 
0: jdbc:hive2://localhost:10000><code>alter table nascimento add partition(ano=2016); </code>

Retorna
<prev>
No rows affected (0.154 seconds)
</prev>

0: jdbc:hive2://localhost:10000><code>alter table nascimento add partition(ano=2017);</code>

Retorna:

<prev>
No rows affected (0.116 seconds)
</prev>

* Verificando se criou 
root@namenode:/# <code>hdfs dfs -ls /user/aluno/marcosena/data/nascimento/ </code>

Retorna:

<prev>
Found 3 items

drwxr-xr-x   - root supergroup          0 2022-02-16 00:19 /user/aluno/marcosena/data/nascimento/ano=2015

drwxr-xr-x   - root supergroup          0 2022-02-16 00:53 /user/aluno/marcosena/data/nascimento/ano=2016

drwxr-xr-x   - root supergroup          0 2022-02-16 00:53 /user/aluno/marcosena/data/nascimento/ano=2017
root@namenode:/#
</prev>

* Agora vamos sair do beeline e ir para  hdfs e enviar os daDos 

# Enviando os dados 
root@namenode:/# <code> hdfs dfs -put /input/exercises-data/names/yob2016.txt /user/aluno/marcosena/data/nascimento/ano=2016 </code>

root@namenode:/# <code> hdfs dfs -put /input/exercises-data/names/yob2017.txt /user/aluno/marcosena/data/nascimento/ano=2017 </code>

# Verificando se armazenou 2016

0: jdbc:hive2://localhost:10000> <code> select * from marcosena.nascimento where nascimento.ano=2016 limit 10; </code>

Retorna:

<prev>
+------------------+------------------+------------------------+-----------------+
| nascimento.nome  | nascimento.sexo  | nascimento.frequencia  | nascimento.ano  |
+------------------+------------------+------------------------+-----------------+
| Emma             | F                | 19471                  | 2016            |
| Olivia           | F                | 19327                  | 2016            |
| Ava              | F                | 16283                  | 2016            |
| Sophia           | F                | 16112                  | 2016            |
| Isabella         | F                | 14772                  | 2016            |
| Mia              | F                | 14415                  | 2016            |
| Charlotte        | F                | 13080                  | 2016            |
| Abigail          | F                | 11747                  | 2016            |
| Emily            | F                | 10957                  | 2016            |
| Harper           | F                | 10773                  | 2016            |
+------------------+------------------+------------------------+-----------------+
10 rows selected (1.46 seconds)
</prev>

0: jdbc:hive2://localhost:10000><code> select * from marcosena.nascimento where nascimento.ano=2016 limit 10;</code>

Retorna:

<prev>
+------------------+------------------+------------------------+-----------------+
| nascimento.nome  | nascimento.sexo  | nascimento.frequencia  | nascimento.ano  |
+------------------+------------------+------------------------+-----------------+
| Emma             | F                | 19471                  | 2016            |
| Olivia           | F                | 19327                  | 2016            |
| Ava              | F                | 16283                  | 2016            |
| Sophia           | F                | 16112                  | 2016            |
| Isabella         | F                | 14772                  | 2016            |
| Mia              | F                | 14415                  | 2016            |
| Charlotte        | F                | 13080                  | 2016            |
| Abigail          | F                | 11747                  | 2016            |
| Emily            | F                | 10957                  | 2016            |
| Harper           | F                | 10773                  | 2016            |
+------------------+------------------+------------------------+-----------------+
10 rows selected (1.46 seconds)
</prev>

# Verificando 2017

0: jdbc:hive2://localhost:10000><code> select * from marcosena.nascimento where nascimento.ano=2017 limit 5; </code>

Retorna:

<prev>
+------------------+------------------+------------------------+-----------------+
| nascimento.nome  | nascimento.sexo  | nascimento.frequencia  | nascimento.ano  |
+------------------+------------------+------------------------+-----------------+
| Emma             | F                | 19738                  | 2017            |
| Olivia           | F                | 18632                  | 2017            |
| Ava              | F                | 15902                  | 2017            |
| Isabella         | F                | 15100                  | 2017            |
| Sophia           | F                | 14831                  | 2017            |
+------------------+------------------+------------------------+-----------------+
5 rows selected (0.266 seconds)
0: jdbc:hive2://localhost:10000>
</prev>

* Sempre fazer as partições baseado na frequencia de uso dos seus wheres

 