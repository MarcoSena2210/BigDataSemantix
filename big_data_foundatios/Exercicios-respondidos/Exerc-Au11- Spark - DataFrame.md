Exercícios - Spark - DataFrame
Vencimento Sem prazo de entrega Pontos 0 Enviando uma caixa de entrada de texto
Spark - Exercícios de DataFrame

## 1. Enviar o diretório local “/input/exercises-data/juros_selic” para o HDFS em “/user/marcosena/<nome>/data”

Resposta 
## 1° -Acessar p namenode
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker exec -it namenode bash
root@namenode:/#

## Resposta 
## root@namenode:/# hdfs dfs -put /input/exercises-data/juros_selic/ /user/aluno/marcosena/data
root@namenode:/#
root@namenode:/# # So para confirmar
root@namenode:/#


## Para confirmar 
root@namenode:/# hdfs dfs -ls /user/aluno/marcosena/data
Found 4 items
drwxr-xr-x   - root supergroup          0 2022-02-13 15:22 /user/aluno/marcosena/data/escola
drwxr-xr-x   - root supergroup          0 2022-02-19 01:04 /user/aluno/marcosena/data/juros_selic
drwxr-xr-x   - root supergroup          0 2022-02-16 00:43 /user/aluno/marcosena/data/nascimento
-rw-r--r--   2 root supergroup          0 2022-02-13 15:50 /user/aluno/marcosena/data/test

## root@namenode:/# hdfs dfs -ls /user/aluno/marcosena/data/juros_selic
Found 3 items
-rw-r--r--   3 root supergroup       8348 2022-02-19 01:04 /user/aluno/marcosena/data/juros_selic/juros_selic
-rw-r--r--   3 root supergroup      14621 2022-02-19 01:04 /user/aluno/marcosena/data/juros_selic/juros_selic.json
-rw-r--r--   3 root supergroup      13147 2022-02-19 01:04 /user/aluno/marcosena/data/juros_se



##  2. 0Criar o DataFrame jurosDF para ler o arquivo no HDFS “/user/aluno/<nome>/data/juros_selic/juros_selic.json”

## Agora vamos sair do namenode (hdfs)  e e acessar o spark shell (spark-shel) 
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker exec -it spark bash
root@spark:/# spark-shell
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
22/02/22 08:20:16 WARN spark.SparkConf: Note that spark.local.dir will be overridden by the value set by the cluster manager (via SPARK_LOCAL_DIRS in mesos/standalone/kubernetes and LOCAL_DIRS in YARN).
Spark context Web UI available at http://spark:4040
Spark context available as 'sc' (master = local[*], app id = local-1645518018505).
Spark session available as 'spark'.
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 2.4.1
      /_/

Using Scala version 2.11.12 (Java HotSpot(TM) 64-Bit Server VM, Java 1.8.0_201)
Type in expressions to have them evaluated.
Type :help for more information.

scala>


## Resposta:
val jurosDF10 = jurosDF.where("valor >10")



   Obs: Se digitarmos o comando segido de ponto (.) +tab, será exibidoum help com  todos os comandos possíveis.

scala> val juroaDF = spark.      (+TAB) 
# Retorna:
baseRelationToDataFrame   close   createDataFrame   emptyDataFrame   experimental   listenerManager   range   readStream     sharedState    sql          stop      table   udf
catalog                   conf    createDataset     emptyDataset     implicits      newSession        read    sessionState   sparkContext   sqlContext   streams   time    version


scala> val juroaDF = spark.read.  (+TAB) 
# Retorna
csv   format   jdbc   json   load   option   options   orc   parquet   schema   table   text   textFile

## Resposta: 

scala> val jurosDF = spark.read.json("/user/aluno/marcosena/data/juros_selic/juros_selic.json")
# Retorna:
jurosDF: org.apache.spark.sql.DataFrame = [data: string, valor: string]

scala>


## 3. Visualizar o Schema do jurosDF
Resposta 
cala> jurosDF.printSchema
root
 |-- data: string (nullable = true)
 |-- valor: string (nullable = true)

ou com tparenteses
scala> jurosDF.printSchema()
root
 |-- data: string (nullable = true)
 |-- valor: string (nullable = true)

## 4. Mostrar os 5 primeiros registros do jutosDF
Returna
scala> jurosDF.show(5,false) 

Dica:false sempre mostra´raas casas decimais, nossos exemplos jáestão com as casas decimais, mas poderia não ter.

+----------+-----+
|      data|valor|
+----------+-----+
|01/06/1986| 1.27|
|01/07/1986| 1.95|
|01/08/1986| 2.57|
|01/09/1986| 2.94|
|01/10/1986| 1.96|
+----------+-----+
only showing top 5 rows

## 5. Contar a quantidade de registros do jurosDF
scala> jurosDF.count
res7: Long = 393

## 6. Criar o DataFrame jurosDF10 para filtrar apenas os registros com o campo “valor” maior que 10
Resposta:
scala> val jurosDF10 = jurosDF.where("valor > 10").show
+----------+-----+
|      data|valor|
+----------+-----+
|01/01/1987|11.00|
|01/02/1987|19.61|
|01/03/1987|11.95|
|01/04/1987|15.30|
|01/05/1987|24.63|
|01/06/1987|18.02|
|01/11/1987|12.92|
|01/12/1987|14.38|
|01/01/1988|16.78|
|01/02/1988|18.35|
|01/03/1988|16.59|
|01/04/1988|20.25|
|01/05/1988|18.65|
|01/06/1988|20.17|
|01/07/1988|24.69|
|01/08/1988|22.63|
|01/09/1988|26.25|
|01/10/1988|29.79|
|01/11/1988|28.41|
|01/12/1988|30.24|
+----------+-----+
only showing top 20 rows

jurosDF10: Unit = ()


CUIDADO: val jurosDF10 = jurosDF.where("valor > 10").show(10) Esta ERRADO,  
está armazenando o valor da visualição.deixou de ser um dataframe 

scala> jurosDF10.show(10)
<console>:24: error: not found: value jurosDF10
       jurosDF10.show(10)
       ^

O correto seria assim:

scala> val jurosDF10 = jurosDF.where("valor >10")
jurosDF10: org.apache.spark.sql.Dataset[org.apache.spark.sql.Row] = [data: string, valor: string]

Passou a ser um dataset porque tem esse shema associadao a ele. 

scala> jurosDF10.show(10)
+----------+-----+
|      data|valor|
+----------+-----+
|01/01/1987|11.00|
|01/02/1987|19.61|
|01/03/1987|11.95|
|01/04/1987|15.30|
|01/05/1987|24.63|
|01/06/1987|18.02|
|01/11/1987|12.92|
|01/12/1987|14.38|
|01/01/1988|16.78|
|01/02/1988|18.35|
+----------+-----+
only showing top 10 rows       

Parei aqui.

## 7. Salvar o DataFrame jurosDF10  como tabela Hive “<nome>.tab_juros_selic”
Resposta 

scala> jurosDF10.write.saveAsTable("marcosena.tab_juros_selic")

Dica: Toda tabela hive é salva em /usr/hive/warehouse/marcosena.db/tab_juros_selic
## 8. Criar o DataFrame jurosHiveDF para ler a tabela “<nome>.tab_juros_selic”
## Resposta:
scala> val jurosHiveDF = spark.read.table("marcosena.tab_juros_selic")

## retorna.
jurosHiveDF: org.apache.spark.sql.DataFrame = [data: string, valor: string]

scala>

## 9. Visualizar o Schema do jurosHiveDF
Resposta:
scala> jurosHiveDF.printSchema
Retorno:
root
 |-- data: string (nullable = true)
 |-- valor: string (nullable = true)


scala>

## 10. Mostrar os 5 primeiros registros do jurosHiveDF
Resposta:
scala> jurosHiveDF.show(5)
Resultado
+----------+-----+
|      data|valor|
+----------+-----+
|01/01/1987|11.00|
|01/02/1987|19.61|
|01/03/1987|11.95|
|01/04/1987|15.30|
|01/05/1987|24.63|
+----------+-----+
only showing top 5 rows


## 11. Salvar o DataFrame jurosHiveDF no HDFS no diretório “/user/aluno/nome/data/save_juros” no formato parquet
Dica: Pode ser usado o formato parque ou o save que já é o padrão e salva em parque.
## Resposta:
scala> jurosHiveDF.write.save("/user/aluno/marcosena/data/save_juros")
## Retorno:
Não apareceu nada é porque funcionou



12. Visualizar o save_juros no HDFS
dica  CTRL + D para sair (sair do shell)
      CTRL + D para sair (spark)
      Acessar o namenode
      O spark sempre cria uma pasta _SUCCESS

      Observamos que mesmo usando o (save, formato padrão), o spark criou uma diretório no formato snappy.parquet.Foi criado uma partição, entretanto ele permite que você defina mais de uma partição.
      Foi adicionado a compressão. 



marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker exec -it namenode bash
root@namenode:/# hdfs dfs -ls /user/aluno/marcosena/data/save_juros
## Retorno:

Found 2 items
-rw-r--r--   2 root supergroup          0 2022-02-22 08:55 /user/aluno/marcosena/data/save_juros/_SUCCESS
-rw-r--r--   2 root supergroup       1419 2022-02-22 08:55 /user/aluno/marcosena/data/save_juros/part-00000-4e0426e0-8ea4-4b50-ab71-2b6f3bc8e439-c000.snappy.parquet
root@namenode:/#

Vamos aproveitar e verificar a tabela hive que criamos anteriormente.
root@namenode:/# hdfs dfs -ls /user/hive/warehouse/marcosena.db/tab_juros_selic
Found 2 items
-rw-r--r--   2 root supergroup          0 2022-02-22 01:34 /user/hive/warehouse/marcosena.db/tab_juros_selic/_SUCCESS
-rw-r--r--   2 root supergroup       1419 2022-02-22 01:34 /user/hive/warehouse/marcosena.db/tab_juros_selic/part-00000-e901dafa-0614-4425-b364-6128f3a87dfa-c000.snappy.parquet
root@namenode:/#


13. Criar o DataFrame jurosHDFS para ler o diretório do “save_juros” da questão 8
## Resposta:
scala> val jurosHDFS = spark.read.load("/user/aluno/marcosena/data/save_juros")
## retorno
jurosHDFS: org.apache.spark.sql.DataFrame = [data: string, valor: string]

scala>

14. Visualizar o Schema do jurosHDFS
scala> jurosHDFS.printSchema
root
 |-- data: string (nullable = true)
 |-- valor: string (nullable = true)


scala>
15. Mostrar os 5 primeiros registros do jurosHDFS
scala> jurosHDFS.show(5)
+----------+-----+
|      data|valor|
+----------+-----+
|01/01/1987|11.00|
|01/02/1987|19.61|
|01/03/1987|11.95|
|01/04/1987|15.30|
|01/05/1987|24.63|
+----------+-----+
only showing top 5 rows


scala>

Fim-Sucesso