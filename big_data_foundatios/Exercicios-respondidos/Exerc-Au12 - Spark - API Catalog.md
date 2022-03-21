Exerc-Au11 - Spark - API Catalog
Vencimento Sem prazo de entrega Pontos 0 Enviando uma caixa de entrada de texto
Spark - Exercícios da API Catalog

Realizar os exercícios usando a API Catalog.

## 1. Visualizar todos os banco de dados
Dica: Se colocarmos o comando spark. e precionarmos o TAB será exibido as possibilidade para o comando.
O mesmo serve para os demais, como no exemplo abaixo.Observamos qua na resposta foi criado na memória uma varável chamada "res9", que equivale a termos dado val é igual a tudo isso ""   

scala> spark.
baseRelationToDataFrame   conf              emptyDataFrame   implicits         range        sessionState   sql          streams   udf
catalog                   createDataFrame   emptyDataset     listenerManager   read         sharedState    sqlContext   table     version
close                     createDataset     experimental     newSession        readStream   sparkContext   stop         time

scala> spark.catalog.
cacheTable            currentDatabase      functionExists   isCached        listTables          setCurrentDatabase
clearCache            databaseExists       getDatabase      listColumns     recoverPartitions   tableExists
createExternalTable   dropGlobalTempView   getFunction      listDatabases   refreshByPath       uncacheTable
createTable           dropTempView         getTable         listFunctions   refreshTable

scala> spark.catalog.list
listColumns   listDatabases   listFunctions   listTables
## Resposta
scala> spark.catalog.listDatabases
Retorna:
res13: org.apache.spark.sql.Dataset[org.apache.spark.sql.catalog.Database] = [name: string, description: string ... 1 more field]

scala>
scala> spark.catalog.listDatabases.show
+---------+--------------------+--------------------+
|     name|         description|         locationUri|
+---------+--------------------+--------------------+
|  default|Default Hive data...|hdfs://namenode:8...|
|marcosena|                    |hdfs://namenode:8...|
+---------+--------------------+--------------------+


scala>
Dica: escrevendo a palavra false, elemostra tudo.

scala> spark.catalog.listDatabases.show(false)
+---------+---------------------+-----------------------------------------------------+
|name     |description          |locationUri                                          |
+---------+---------------------+-----------------------------------------------------+
|default  |Default Hive database|hdfs://namenode:8020/user/hive/warehouse             |
|marcosena|                     |hdfs://namenode:8020/user/hive/warehouse/marcosena.db|
+---------+---------------------+-----------------------------------------------------+


scala>



## 2. Definir o banco de dados “seu-nome” como principal
## Resposta:
scala> spark.catalog.setCurrentDatabase("marcosena")

scala>
 Dica: Se não apareceu erro foi porque deu certo.

## 3. Visualizar todas as tabelas do banco de dados “seu-nome”
Resposta:
scala> spark.catalog.listTables.show

Retorna:
+------------------+---------+-----------+---------+-----------+
|              name| database|description|tableType|isTemporary|
+------------------+---------+-----------+---------+-----------+
|        nascimento|marcosena|       null| EXTERNAL|      false|
|       nascimento1|marcosena|       null| EXTERNAL|      false|
|               pop|marcosena|       null|  MANAGED|      false|
|       pop_parquet|marcosena|       null|  MANAGED|      false|
|pop_parquet_snappy|marcosena|       null|  MANAGED|      false|
|        tab_alunos|marcosena|       null|  MANAGED|      false|
|   tab_juros_selic|marcosena|       null|  MANAGED|      false|
+------------------+---------+-----------+---------+-----------+


scala>
4. Visualizar as colunas da tabela tab_alunos

scala> spark.catalog.listColumns("tab_alunos").show
+-----------------+-----------+--------+--------+-----------+--------+
|             name|description|dataType|nullable|isPartition|isBucket|
+-----------------+-----------+--------+--------+-----------+--------+
|      id_discente|       null|     int|    true|      false|   false|
|             nome|       null|  string|    true|      false|   false|
|     ano_ingresso|       null|     int|    true|      false|   false|
| periodo_ingresso|       null|     int|    true|      false|   false|
|            nivel|       null|  string|    true|      false|   false|
|id_forma_ingresso|       null|     int|    true|      false|   false|
|         id_curso|       null|     int|    true|      false|   false|
+-----------------+-----------+--------+--------+-----------+--------+


scala>

## 5.  Visualizar os 10 primeiros registos da tabela "tab_alunos" com uso do spark.sql
Dica: Vamos resposder com sql e sem, as duas formas tem as mesmas funções.

Resposta: 
scala> spark.sql("select * from tab_alunos limit 10").show()
+-----------+--------------------+------------+----------------+-----+-----------------+--------+
|id_discente|                nome|ano_ingresso|periodo_ingresso|nivel|id_forma_ingresso|id_curso|
+-----------+--------------------+------------+----------------+-----+-----------------+--------+
|      18957|ABELARDO DA SILVA...|        2017|               1|    G|            62151|   76995|
|        553| ABIEL GODOY MARIANO|        2015|            null|    M|          2081113|    3402|
|      17977|ABIGAIL ANTUNES S...|        2017|               1|    T|          2081111|  759711|
|      16613|ABIGAIL FERNANDA ...|        2017|            null|    M|            37350|    1222|
|      17398|ABIGAIL JOSIANE R...|        2017|            null|    M|            37350|    5041|
|      26880|ABIMAEL CHRISTOPF...|        2019|               1|    T|          2081115| 1913420|
|      28508|   ABNER NUNES PERES|        2019|               1|    G|            37350|  181097|
|      18693|ACSA PEREIRA RODR...|        2017|               1|    G|            62151|   77498|
|      28071|ACSA ROBALO DOS S...|        2019|               1|    T|          2081115| 3996007|
|      21968|AÇUCENA CARVALHO ...|        2018|               0|    N|          2081113| 2399357|
+-----------+--------------------+------------+----------------+-----+-----------------+--------+


scala>

SEM SQL

scala> spark.read.table("tab_alunos").show
+-----------+--------------------+------------+----------------+-----+-----------------+--------+
|id_discente|                nome|ano_ingresso|periodo_ingresso|nivel|id_forma_ingresso|id_curso|
+-----------+--------------------+------------+----------------+-----+-----------------+--------+
|      18957|ABELARDO DA SILVA...|        2017|               1|    G|            62151|   76995|
|        553| ABIEL GODOY MARIANO|        2015|            null|    M|          2081113|    3402|
|      17977|ABIGAIL ANTUNES S...|        2017|               1|    T|          2081111|  759711|
|      16613|ABIGAIL FERNANDA ...|        2017|            null|    M|            37350|    1222|
|      17398|ABIGAIL JOSIANE R...|        2017|            null|    M|            37350|    5041|
|      26880|ABIMAEL CHRISTOPF...|        2019|               1|    T|          2081115| 1913420|
|      28508|   ABNER NUNES PERES|        2019|               1|    G|            37350|  181097|
|      18693|ACSA PEREIRA RODR...|        2017|               1|    G|            62151|   77498|
|      28071|ACSA ROBALO DOS S...|        2019|               1|    T|          2081115| 3996007|
|      21968|AÇUCENA CARVALHO ...|        2018|               0|    N|          2081113| 2399357|
|      22374|ADALBERTO LUFT LU...|        2018|               0|    N|          2081113| 2399354|
|      26367|ADALBERTO SEIDEL ...|        2019|               1|    G|            34132|   79131|
|       4392|ADALGIZA OLIVEIRA...|        2013|               1|    T|            37350|      34|
|       4573|ADANA BIANCA DOS ...|        2012|               2|    T|            37350|      39|
|      16219|ADÃO ANTÔNIO PILL...|        2016|               2|    L|            34112| 1444206|
|      25120|ADÃO VAGNER DOS S...|        2018|               1|    G|            62151|  283646|
|      19638|     ADELAR DE MELLO|        2017|               1|    G|            37350|   65489|
|      13232|ADELAR SANTOS DAS...|        2016|               1|    T|            37350|    2057|
|      10071|ADELI CRISTIANO W...|        2012|               2|    G|            62151|  182354|
|      24787|ADELITA ALVES SIL...|        2018|               1|    T|          2081111|      31|
+-----------+--------------------+------------+----------------+-----+-----------------+--------+
only showing top 20 rows


6. Clicar no botão de Enviar Tarefa, e enviar o texto: ok