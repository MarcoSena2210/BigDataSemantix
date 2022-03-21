Exer11 - Spark - Esquema e Join

Vencimento Sem prazo de entrega Pontos 0 Enviando uma caixa de entrada de texto
Spark - Exercícios de Esquema e Join

1. Criar o DataFrame alunosDF para ler o arquivo no hdfs “/user/aluno/<nome>/data/escola/alunos.csv” sem usar as “option”

scala> val alunosDF = spark.read.csv("/user/aluno/marcosena/data/escola/alunos.csv")
alunosDF: org.apache.spark.sql.DataFrame = [_c0: string, _c1: string ... 5 more fields]

scala>


2. Visualizar o esquema do alunosDF
scala> alunosDF.printSchema
Reorna
root
 |-- _c0: string (nullable = true)
 |-- _c1: string (nullable = true)
 |-- _c2: string (nullable = true)
 |-- _c3: string (nullable = true)
 |-- _c4: string (nullable = true)
 |-- _c5: string (nullable = true)
 |-- _c6: string (nullable = true)


scala>

## 3. Criar o DataFrame alunosDF para ler o arquivo “/user/aluno/<nome>/data/escola/alunos.csv” com a opção de Incluir o cabeçalho
Dica: option("header","true") exibe o cabeçalho porque no arquivo existe o header na primeira linha

scala> val alunosDF = spark.read.option("header","true").csv("/user/aluno/marcosena/data/escola/alunos.csv")

alunosDF: org.apache.spark.sql.DataFrame = [id_discente: string, nome: string ... 5 more fields]

Podemos comprocar a existência do cabeçalho com o comando abaixo:

scala> val alunosDF = spark.read.csv("/user/aluno/marcosena/data/escola/alunos.csv").show(3)
+-----------+--------------------+------------+----------------+-----+-----------------+--------+
|        _c0|                 _c1|         _c2|             _c3|  _c4|              _c5|     _c6|
+-----------+--------------------+------------+----------------+-----+-----------------+--------+
|id_discente|                nome|ano_ingresso|periodo_ingresso|nivel|id_forma_ingresso|id_curso|
|      18957|ABELARDO DA SILVA...|        2017|               1|    G|            62151|   76995|
|        553| ABIEL GODOY MARIANO|        2015|            null|    M|          2081113|    3402|
+-----------+--------------------+------------+----------------+-----+-----------------+--------+
only showing top 3 rows

alunosDF: Unit = ()

scala>



4. Visualizar o esquema do alunosDF
scala> val alunosDF = spark.read.option("header","true").csv("/user/aluno/marcosena/data/escola/alunos.csv")
alunosDF: org.apache.spark.sql.DataFrame = [id_discente: string, nome: string ... 5 more fields]

scala> alunosDF.printSchema
root
 |-- id_discente: string (nullable = true)
 |-- nome: string (nullable = true)
 |-- ano_ingresso: string (nullable = true)
 |-- periodo_ingresso: string (nullable = true)
 |-- nivel: string (nullable = true)
 |-- id_forma_ingresso: string (nullable = true)
 |-- id_curso: string (nullable = true)

 Observe que todos osa campos estão como string, mesmo tendo valores que poderiam ser inteiros.
scala> alunosDF.show(3)
+-----------+--------------------+------------+----------------+-----+-----------------+--------+
|id_discente|                nome|ano_ingresso|periodo_ingresso|nivel|id_forma_ingresso|id_curso|
+-----------+--------------------+------------+----------------+-----+-----------------+--------+
|      18957|ABELARDO DA SILVA...|        2017|               1|    G|            62151|   76995|
|        553| ABIEL GODOY MARIANO|        2015|            null|    M|          2081113|    3402|
|      17977|ABIGAIL ANTUNES S...|        2017|               1|    T|          2081111|  759711|
+-----------+--------------------+------------+----------------+-----+-----------------+--------+
only showing top 3 rows

Dica: É possível forçar o spark inferir o tipo de dado,entranto os campos flot srão inferidos para (double), ele sempre fará para o maior tipo possível. 

## 5. Criar o DataFrame alunosDF para ler o arquivo “/user/aluno/<nome>/data/escola/alunos.csv” com a opção de Incluir o cabeçalho e inferir o esquema
scala> val alunosDF = spark.read.option("header","true").option("inferSchema","true").csv("/user/aluno/marcosena/data/escola/alunos.csv")
alunosDF: org.apache.spark.sql.DataFrame = [id_discente: int, nome: string ... 5 more fields]

scala>

6. Visualizar o esquema do alunosDF
scala> alunosDF.printSchema
root
 |-- id_discente: integer (nullable = true)
 |-- nome: string (nullable = true)
 |-- ano_ingresso: integer (nullable = true)
 |-- periodo_ingresso: integer (nullable = true)
 |-- nivel: string (nullable = true)
 |-- id_forma_ingresso: integer (nullable = true)
 |-- id_curso: integer (nullable = true)


scala>

## 7. Salvar o DaraFrame alunosDF como tabela Hive “tab_alunos” no banco de dados <nome>
Dica: Cuidado para não esquecer o seu banco, neste caso "marcosena".
Se o comando for dado dessa forma "...saveAsTable("tab_alunos"),será salva no banco default.Coso não exista uma confuguração no "Catalog"
   
## Resposta:   
scala> alunosDF.write.saveAsTable("marcosena.tab_alunos")

scala>
## Retorno: Se não apareceu nada foi porque deu certo.Salvou com sucesso.


## 8. Criar o DataFrame cursosDF para ler o arquivo “/user/aluno/<nome>/data/escola/cursos.csv” com a opção de Incluir o cabeçalho e inferir o esquema

## Resposta 
scala> val cursosDF = spark.read.option("header","true").option("inferSchema","true").csv("/user/aluno/marcosena/data/escola/cursos.csv")
## Retorno:
cursosDF: org.apache.spark.sql.DataFrame = [id_curso: int, id_unidade: int ... 10 more fields]

scala>


## 9. Criar o DataFrame alunos_cursosDF com o inner join do alunosDF e cursosDF quando o id_curso dos 2 forem o mesmo
Resposta:
scala> val alunos_cursosDF = alunosDF.join(cursosDF,"id_curso")
Retorno:
alunos_cursosDF: org.apache.spark.sql.DataFrame = [id_curso: int, id_discente: int ... 16 more fields]

scala>

## 10. Visualizar os dados, o esquema e a quantidade de registros do alunos_cursosDF

scala> alunos_cursosDF.show(5)
+--------+-----------+--------------------+------------+----------------+-----+-----------------+----------+--------+--------------------+-----+----------------------+------------+--------------------+-------------+-----------------+--------------------+-----+
|id_curso|id_discente|                nome|ano_ingresso|periodo_ingresso|nivel|id_forma_ingresso|id_unidade|  codigo|                nome|nivel|id_modalidade_educacao|id_municipio|id_tipo_oferta_curso|id_area_curso|id_grau_academico|id_eixo_conhecimento|ativo|
+--------+-----------+--------------------+------------+----------------+-----+-----------------+----------+--------+--------------------+-----+----------------------+------------+--------------------+-------------+-----------------+--------------------+-----+
|   76995|      18957|ABELARDO DA SILVA...|        2017|               1|    G|            62151|       194|    null|LICENCIATURA EM C...|    G|                     1|        8550|                   4|     20000006|          8067070|                null|    1|
|    3402|        553| ABIEL GODOY MARIANO|        2015|            null|    M|          2081113|       150|SVTIAGRO|TÉCNICO EM AGROPE...|    M|                     1|        9332|                null|         null|             null|             6264215|    1|
|  759711|      17977|ABIGAIL ANTUNES S...|        2017|               1|    T|          2081111|       696| UGTCADM|TÉCNICO EM ADMINI...|    T|                     1|        9431|                null|         null|             null|              171158|    1|
|    1222|      16613|ABIGAIL FERNANDA ...|        2017|            null|    M|            37350|       349|PBTIQUIM|TÉCNICO EM QUÍMIC...|    M|                     1|        9091|                null|         null|             null|             6264214|    1|
|    5041|      17398|ABIGAIL JOSIANE R...|        2017|            null|    M|            37350|       189|ALTIAGRP|TÉCNICO EM AGROPE...|    M|                     1|        8550|                null|         null|             null|                null|    1|
+--------+-----------+--------------------+------------+----------------+-----+-----------------+----------+--------+--------------------+-----+----------------------+------------+--------------------+-------------+-----------------+--------------------+-----+
only showing top 5 rows

## Exibindo o schema
scala> alunos_cursosDF.printSchema
root
 |-- id_curso: integer (nullable = true)
 |-- id_discente: integer (nullable = true)
 |-- nome: string (nullable = true)
 |-- ano_ingresso: integer (nullable = true)
 |-- periodo_ingresso: integer (nullable = true)
 |-- nivel: string (nullable = true)
 |-- id_forma_ingresso: integer (nullable = true)
 |-- id_unidade: integer (nullable = true)
 |-- codigo: string (nullable = true)
 |-- nome: string (nullable = true)
 |-- nivel: string (nullable = true)
 |-- id_modalidade_educacao: integer (nullable = true)
 |-- id_municipio: integer (nullable = true)
 |-- id_tipo_oferta_curso: integer (nullable = true)
 |-- id_area_curso: integer (nullable = true)
 |-- id_grau_academico: integer (nullable = true)
 |-- id_eixo_conhecimento: integer (nullable = true)
 |-- ativo: integer (nullable = true)
scala>
## Verificando a quantidade
scala> alunos_cursosDF.count
res11: Long = 9954
FIM
