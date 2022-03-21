

# Exercícios - Hive - Criação de Tabela Particionada

## 1. Selecionar os 10 primeiros registros da tabela nascimento pelo ano de 2016

0: jdbc:hive2://localhost:10000><code>  USE MARCOSENA; </code>

Retorna:

<prev>
No rows affected (1.145 seconds)
<prev>

0: jdbc:hive2://localhost:10000><code> select * from nascimento where ano=2016 limit 10; </code>

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
10 rows selected (0.271 seconds)



0: jdbc:hive2://localhost:10000>
<prev>

## 2. Contar a quantidade de nomes de crianças nascidas em 2017

0: jdbc:hive2://localhost:10000><code> select count(nome) as qtd from nascimento where ano=2017;</code>

Retorna:
<prev>
WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
+--------+
|  qtd   |
+--------+
| 32469  |
+--------+
1 row selected (2.104 seconds)


0: jdbc:hive2://localhost:10000>
<prev>

## 3. Contar a quantidade de crianças nascidas em 2017
: jdbc:hive2://localhost:10000><code> select sum(frequencia) as qde from nascimento where ano=2017; </code>

Retorna:

<prev>
WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
+----------+
|   qde    |
+----------+
| 3546301  |
+----------+
<prev>

## 4. Contar a quantidade de crianças nascidas por sexo no ano de 2015

0: jdbc:hive2://localhost:10000><code> select sexo, sum(frequencia) as qde from nascimento where ano=2015 group by sexo; </code>

Retorna:
<prev>
WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
+-------+----------+
| sexo  |   qde    |
+-------+----------+
| F     | 1778883  |
| M     | 1909804  |
+-------+----------+
<prev>

## 5. Mostrar por ordem de ano decrescente a quantidade de crianças nascidas por sexo
0: jdbc:hive2://localhost:10000><code> select ano, sexo, sum(frequencia) as qde from nascimento group by  ano, sexo order by ano desc ; </code>

Retorna:
<prev>
WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
+-------+-------+----------+
|  ano  | sexo  |   qde    |
+-------+-------+----------+
| 2017  | M     | 1834490  |
| 2017  | F     | 1711811  |
| 2016  | M     | 1889052  |
| 2016  | F     | 1763916  |
| 2015  | M     | 1909804  |
| 2015  | F     | 1778883  |
+-------+-------+----------+
6 rows selected (5.446 seconds)
0: jdbc:hive2://localhost:10000>
<prev>

## 6. Mostrar por ordem de ano decrescente a quantidade de crianças nascidas por sexo com o nome iniciado com ‘A’
0: jdbc:hive2://localhost:10000><code> select ano, sexo, sum(frequencia) as qde from  nascimento where nome like 'A%' group by  ano, sexo order by ano desc ; </code>

Retorna:
<prev>
WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
+-------+-------+---------+
|  ano  | sexo  |   qde   |
+-------+-------+---------+
| 2017  | M     | 185566  |
| 2017  | F     | 308551  |
| 2016  | M     | 191854  |
| 2016  | F     | 324185  |
| 2015  | M     | 194722  |
| 2015  | F     | 329690  |
+-------+-------+---------+
6 rows selected (3.941 seconds)
0: jdbc:hive2://localhost:10000>
<prev>

## 7. Qual nome e quantidade das 5 crianças mais nascidas em 2016
 jdbc:hive2://localhost:10000><code> select nome, max(frequencia) as qtd from  nascimento where ano=2016 group by  nome order by qtd desc limit 5;</code>

 Retorna:

 <prev>
WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
+---------+--------+
|  nome   |  qtd   |
+---------+--------+
| Emma    | 19471  |
| Olivia  | 19327  |
| Noah    | 19082  |
| Liam    | 18198  |
| Ava     | 16283  |
+---------+--------+
5 rows selected (4.483 seconds)
0: jdbc:hive2://localhost:10000>
<prev>

## 8. Qual nome e quantidade das 5 crianças mais nascidas em 2016 do sexo masculino e feminino
o order by qtd desc limit 5;00><code> select nome, max(frequencia) as qtd,sexo from  nascimento where ano=2016 group by  nome;
</code>

Retorna:
<prev>
WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
+---------+--------+-------+
|  nome   |  qtd   | sexo  |
+---------+--------+-------+
| Emma    | 19471  | F     |
| Olivia  | 19327  | F     |
| Noah    | 19082  | M     |
| Liam    | 18198  | M     |
| Ava     | 16283  | F     |
+---------+--------+-------+
5 rows selected (4.103 seconds)
<prev>



