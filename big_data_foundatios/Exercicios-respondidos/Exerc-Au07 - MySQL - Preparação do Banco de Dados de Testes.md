#  MySQL - Preparação do Banco de Dados de Testes

* MySQL - Verificar e Instalar os Banco de Dados de testes que serão impostantes para importacação dos dados do local para o container database,vamos usar o docker cp, porém antes precisamos ver o db.sql.

* Aqui temos tanto a base de dados employees e sakila.Podemos observar que nesse diretório temos arquivo de imagem, de dump e de dados, etc.     


marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ <code> ls input/exercises-data/db-sql/sakila </code>

rettorna:
<prev>

README.md  insert_rental.sql  sakila-mv-data.sql  sakila-mv-schema.sql

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$
</prev>


* Listando seu conteúdo
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$<code> ls input/exercises-data/db-sql/ </code>

Retorna:


<prev> 
Changelog      employees_partitioned.sql      load_departments.dump   load_employees.dump  load_salaries3.dump  sakila            test_employees_md5.sql
README.md      employees_partitioned_5.1.sql  load_dept_emp.dump      load_salaries1.dump  load_titles.dump     show_elapsed.sql  test_employees_sha.sql
employees.sql  images                         load_dept_manager.dump  load_salaries2.dump  objects.sql          sql_test.sh

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$
</prev>

* Como funciona, nós vamos mandar o nosso db.sql para o nosso database. Para isso vamos acessar nossa database.

* Como acessar o contêiner database
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$<code> docker exec -it database bash </code>

Retorna:

<prev>
root@database:/#
</prev>

*  Verificando o que tem nele antes de copiar 

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ <code> docker exec -it database bash </code>
root@database:/#<code> ls /  </code>

Retorna:


<prev>
bin   data  docker-entrypoint-initdb.d  etc   lib    media  opt   root  sbin  sys  usr
boot  dev   entrypoint.sh               home  lib64  mnt    proc  run   srv   tmp  var
root@database:/#
</prev>

* Saindo (ctrl + d)

## 1. Copiar os dados do local para o contêiner database

<code>
docker cp input/exercises-data/db-sql/ database:/ nput/exercises-data/db-sql/ database:/

</code>

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$<code> docker exec -it database bash </code>

root@database:/#<code> ls / </code>

Retorna:
<prev>
bin   data    dev                         entrypoint.sh  home  lib64  mnt  proc  run   srv  tmp  var
boot  db-sql  docker-entrypoint-initdb.d  etc            lib   media  opt  root  sbin  sys  usr
root@database:/#nput/exercises-data/db-sql/ database:/
</prev>

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$<code> docker exec -it database bash </code>
root@database:/#<code> ls / </code>

Retorna:

<prev>
bin   data    dev                         entrypoint.sh  home  lib64  mnt  proc  run   srv  tmp  var
boot  db-sql  docker-entrypoint-initdb.d  etc            lib   media  opt  root  sbin  sys  usr
root@database:/#
</prev>

## 2. Acessar o contêiner database
<code>
docker exec -it database bash
</code>

## 3. Instalar Banco de Dados de testes

* Diretório /db-sql - BD employees (Já existe)
<code>  
  cd /db-sql  
</code>

* Para acessar o mysql 
<code>
 mysql -h localhost -u root -psecret
</code>

 root@database:/# <code> mysql -h localhost -u root -psecret </code>

 Retorna:
 <prev>
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.7.29 MySQL Community Server (GPL)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
</prev>

* Outra forma. Como já estamos logados como root e no localhost, outra maneira de logar é:
<code>
mysql -psecret 
</code>

root@database:/# <code> mysql -psecret </code>

Retorna: 

<prev>
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 4
Server version: 5.7.29 MySQL Community Server (GPL)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>

</prev>

* Vamos verificar quais tabelas tremos aqui.
<code> show databases; </code>

Retorna:

<prev>
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| employees          |
| hue                |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6/ rows in set (0.01 sec)
<prev>

* Para excluir
<code> drop database employees;</code>

* Não irei executar  

* Para sair do mysql ctrl + d

* Para importar o employees iremos para o diretório db-sql e da seguinte forma. 
no rootdatabase:
<code>  cd /db-sql/ </code>

no rootdatabase :<code> mysql -psecret < employees.sql (NÃO vamos fazer) </code>

* Iremos fazer a importação do sakila,pois não existe na database.1º vamos gerar o schema  
Diretório /db-sql/sakila - BD sakila
$<code> cd /db-sql/sakila/ </code>
<code>
$ mysql -psecret < sakila-mv-schema.sql
$ mysql -psecret < sakila-mv-data.sql
</code>

root@database:/db-sql# <code> cd sakila/ 
</code> 

root@database:/db-sql/sakila# <code>ls / </code>

Retorna:


<prev>

bin   data    dev                         entrypoint.sh  home  lib64  mnt  proc  run   srv  tmp  var
boot  db-sql  docker-entrypoint-initdb.d  etc            lib   media  opt  root  sbin  sys  usr
</prev>


root@database:/db-sql/sakila# <code>  mysql -psecret < sakila-mv-schema.sql </
code>

Retorna:

<prev> 
mysql: [Warning] Using a password on the command line interface can be insecure.
</prev>

root@database:/db-sql/sakila# <code>  mysql -psecret < sakila-mv-data.sql </code>

Retorna:

<prev>
mysql: [Warning] Using a password on the command line interface can be insecure.
root@database:/db-sql/sakila#
<prev>


* Para verificar acessa o mysql e exbe database :
<code> mysql -psecret </code> 

root@database:/db-sql/sakila# <code> mysql -psecret </code>

Retorna:

<prev>
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 7
Server version: 5.7.29 MySQL Community Server (GPL)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| employees          |
| hue                |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

</prev>

* Vamos explorar mais um pouco, vamos listar as tabelas do banco sakila e depois escolher uma tabela e lista os 5 primeiros registros.

mysql><code>  use sakila; </code>

Retorna:

<prev>
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed  
</prev>


mysql> <code> show tables; </code>

Retorna:

<prev>
+----------------------------+
| Tables_in_sakila           |
+----------------------------+
| actor                      |
| actor_info                 |
| address                    |
| category                   |
| city                       |
| country                    |
| customer                   |
| customer_list              |
| film                       |
| film_actor                 |
| film_category              |
| film_list                  |
| film_text                  |
| inventory                  |
| language                   |
| nicer_but_slower_film_list |
| payment                    |
| rental                     |
| sales_by_film_category     |
| sales_by_store             |
| staff                      |
| staff_list                 |
| store                      |
+----------------------------+
23 rows in set (0.01 sec)
</prev>

mysql> <code> select * from language limit 5; </code>


Retorna:


<prev>
+-------------+----------+---------------------+
| language_id | name     | last_update         |
+-------------+----------+---------------------+
|           1 | English  | 2006-02-15 05:02:19 |
|           2 | Italian  | 2006-02-15 05:02:19 |
|           3 | Japanese | 2006-02-15 05:02:19 |
|           4 | Mandarin | 2006-02-15 05:02:19 |
|           5 | French   | 2006-02-15 05:02:19 |
+-------------+----------+---------------------+
5 rows in set (0.00 sec)

mysql>

* Agora vamos sair daqui (ctrl+d) e acessar o namenode:

<code> docker exec -it namenode bash 
</code>


* Com o Sqoop importar os dados do database para o hdfs. No datamode só fica os dados.  

root@namenode:/#<code> sqoop import database -> hdfs(database)</code>
            