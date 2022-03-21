Exercícios - Spark - SQL Queries vs Operações de DataFrame
Vencimento Sem prazo de entrega Pontos 0 Enviando uma caixa de entrada de texto
Spark - Exercícios de SQL Queries vs Operações de DataFrame

Realizar as seguintes consultas usando SQL queries e transformações de DataFrame na tabela “tab_alunos” no banco de dados <nome>
Dica: Como já foi setado o catalog, podemos listar os camposde foram direta, apenas para verificamos os campos.Se você tiver saido do spark precisa setar novamente.
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



## 1. Visualizar o id e nome dos 5 primeiros registros
Resposta:
scala> spark.sql("select id_discente,nome from tab_alunos limit 5").show
+-----------+--------------------+
|id_discente|                nome|
+-----------+--------------------+
|      18957|ABELARDO DA SILVA...|
|        553| ABIEL GODOY MARIANO|
|      17977|ABIGAIL ANTUNES S...|
|      16613|ABIGAIL FERNANDA ...|
|      17398|ABIGAIL JOSIANE R...|
+-----------+--------------------+
scala> 

## ou essa solução é melhor quando vamos precidsar ler essa informação várias vezes.
scala> val alunosHiveDF = spark.read.table("tab_alunos")
Retorna:
alunosHiveDF: org.apache.spark.sql.DataFrame = [id_discente: int, nome: string ... 5 more fields]

scala> alunosHiveDF.select("id_discente","nome").limit(5).show
+-----------+--------------------+
|id_discente|                nome|
+-----------+--------------------+
|      18957|ABELARDO DA SILVA...|
|        553| ABIEL GODOY MARIANO|
|      17977|ABIGAIL ANTUNES S...|
|      16613|ABIGAIL FERNANDA ...|
|      17398|ABIGAIL JOSIANE R...|
+-----------+--------------------+




## 2. Visualizar o id, nome e ano quando o ano de ingresso for maior ou igual a 2018
## Resposta:

scala> spark.sql("select id_discente,nome,ano_ingresso from tab_alunos where ano_ingresso >= 2018").show
+-----------+--------------------+------------+
|id_discente|                nome|ano_ingresso|
+-----------+--------------------+------------+
|      26880|ABIMAEL CHRISTOPF...|        2019|
|      28508|   ABNER NUNES PERES|        2019|
|      28071|ACSA ROBALO DOS S...|        2019|
|      21968|AÇUCENA CARVALHO ...|        2018|
|      22374|ADALBERTO LUFT LU...|        2018|
|      26367|ADALBERTO SEIDEL ...|        2019|
|      25120|ADÃO VAGNER DOS S...|        2018|
|      24787|ADELITA ALVES SIL...|        2018|
|      28001|ADEMIR LUIZ SCHEN...|        2019|
|      21618|    ADENIR CALLEGARO|        2018|
|      27346|        ADILSON HAAS|        2019|
|      21569|ADILSON LOPES DA ...|        2018|
|      24456|ADILSON MARTINS D...|        2018|
|      24958|  ADIR JOSÉ HECHMANN|        2018|
|      25805|ADRIANA CLARICE H...|        2018|
|      27021|ADRIANA GÖTENS AN...|        2019|
|      25968|ADRIANA MAGALHÃES...|        2018|
|      27232|ADRIANA PAIVA GÜL...|        2019|
|      21247|ADRIANA PERES FER...|        2018|
|      27223|       ADRIANA PIRAN|        2019|
+-----------+--------------------+------------+
only showing top 20 rows

## oU COM DATAframe
scala> alunosHiveDF.select("id_discente","nome","ano_ingresso").where("ano_ingresso >= 2018").show
+-----------+--------------------+------------+
|id_discente|                nome|ano_ingresso|
+-----------+--------------------+------------+
|      26880|ABIMAEL CHRISTOPF...|        2019|
|      28508|   ABNER NUNES PERES|        2019|
|      28071|ACSA ROBALO DOS S...|        2019|
|      21968|AÇUCENA CARVALHO ...|        2018|
|      22374|ADALBERTO LUFT LU...|        2018|
|      26367|ADALBERTO SEIDEL ...|        2019|
|      25120|ADÃO VAGNER DOS S...|        2018|
|      24787|ADELITA ALVES SIL...|        2018|
|      28001|ADEMIR LUIZ SCHEN...|        2019|
|      21618|    ADENIR CALLEGARO|        2018|
|      27346|        ADILSON HAAS|        2019|
|      21569|ADILSON LOPES DA ...|        2018|
|      24456|ADILSON MARTINS D...|        2018|
|      24958|  ADIR JOSÉ HECHMANN|        2018|
|      25805|ADRIANA CLARICE H...|        2018|
|      27021|ADRIANA GÖTENS AN...|        2019|
|      25968|ADRIANA MAGALHÃES...|        2018|
|      27232|ADRIANA PAIVA GÜL...|        2019|
|      21247|ADRIANA PERES FER...|        2018|
|      27223|       ADRIANA PIRAN|        2019|
+-----------+--------------------+------------+
only showing top 20 rows


scala>



scala>



## 3. Visualizar por ordem alfabética do nome o id, nome e ano quando o ano de ingresso for maior ou igual a 2018
### Resposta
scala> spark.sql("select id_discente,nome,ano_ingresso from tab_alunos where ano_ingresso >= 2018 ORDER BY NOME DESC").show
+-----------+--------------------+------------+
|id_discente|                nome|ano_ingresso|
+-----------+--------------------+------------+
|      24161|ÍTALO CARPES DA C...|        2018|
|      23789|  ÍGOR ANTONINI HORN|        2018|
|      25323|ÊNDREO SANTOS SEE...|        2018|
|      22611|ÊNDREO DE CARVALH...|        2018|
|      22759|ÊMILY MANUELA DE ...|        2018|
|      26310|ÉVELYN SOLENE DE ...|        2019|
|      26921|ÉVELYN PAZ GONÇALVES|        2019|
|      26576|ÉVELIN LUÍZA MION...|        2019|
|      22341|      ÉVELIN DA ROSA|        2018|
|      23718|ÉRICSSON LIMA DA ...|        2018|
|      26262|   ÉRICA SILVA VEIGA|        2019|
|      27781|ÉRICA PRADO DE AL...|        2019|
|      24923|ÉRICA MELLO DOS S...|        2018|
|      26266| ÉRICA DA ROSA PINTO|        2019|
|      28255|ÉRICA BERTOLDO DA...|        2019|
|      27927|ÉRIC SCHUSTER PAR...|        2019|
|      25189|ÉRIC RANIE CONTES...|        2018|
|      23031|  ÉRIC BARBOSA ROCHA|        2018|
|      26430|ÉMERSON SILVA DOS...|        2019|
|      23223|ÉMERSON SAMUEL DA...|        2018|
+-----------+--------------------+------------+
only showing top 20 rows


scala>
## Com dataframe o mesmo resultado.
scala> alunosHiveDF.select("id_discente","nome","ano_ingresso").where("ano_ingresso >= 2018 ").orderBy($"nome".desc).show
+-----------+--------------------+------------+
|id_discente|                nome|ano_ingresso|
+-----------+--------------------+------------+
|      24161|ÍTALO CARPES DA C...|        2018|
|      23789|  ÍGOR ANTONINI HORN|        2018|
|      25323|ÊNDREO SANTOS SEE...|        2018|
|      22611|ÊNDREO DE CARVALH...|        2018|
|      22759|ÊMILY MANUELA DE ...|        2018|
|      26310|ÉVELYN SOLENE DE ...|        2019|
|      26921|ÉVELYN PAZ GONÇALVES|        2019|
|      26576|ÉVELIN LUÍZA MION...|        2019|
|      22341|      ÉVELIN DA ROSA|        2018|
|      23718|ÉRICSSON LIMA DA ...|        2018|
|      26262|   ÉRICA SILVA VEIGA|        2019|
|      27781|ÉRICA PRADO DE AL...|        2019|
|      24923|ÉRICA MELLO DOS S...|        2018|
|      26266| ÉRICA DA ROSA PINTO|        2019|
|      28255|ÉRICA BERTOLDO DA...|        2019|
|      27927|ÉRIC SCHUSTER PAR...|        2019|
|      25189|ÉRIC RANIE CONTES...|        2018|
|      23031|  ÉRIC BARBOSA ROCHA|        2018|
|      26430|ÉMERSON SILVA DOS...|        2019|
|      23223|ÉMERSON SAMUEL DA...|        2018|
+-----------+--------------------+------------+
only showing top 20 rows


scala>

4. Contar a quantidade de registros do item anterior
Resposta: 
scala> spark.sql("select count(id_discente) from tab_alunos where ano_ingresso >= 2018").show
+------------------+
|count(id_discente)|
+------------------+
|              4266|
+------------------+

Ou 
scala> spark.sql("select id_discente,nome,ano_ingresso from tab_alunos where ano_ingresso >= 2018 ORDER BY NOME DESC").count
res36: Long = 4266

OU

scala> alunosHiveDF.select("id_discente","nome","ano_ingresso").where("ano_ingresso >= 2018 ").orderBy($"nome".desc).count
res37: Long = 4266


scala>

scala>

Finalizado.