video Au11- acessandoo spark:
Pelo 
 
Corrigindo a instalação do docker que não tinha o package do parquet

1-baixamos jar no windows 

2-No menu iniciar do windos digitamos:
\\wsl$ 

3-Clicamos na pasta unbutu, e vamos até a pasta home/../treinamentos/docker-bigdata.
Nesta pasta copiamos o package .jar do windows para ca.

4-Copiamos daqui para o spack com ocamando abaixo, conforme o vídeo.:
docker cp parquet-hadoop-bundle-1.6.0.jar spark:/opt/spark/jars     


marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ ls -la
total 3124
drwxr-xr-x  5 marco marco    4096 Feb 18 21:15 .
drwxr-xr-x  3 marco marco    4096 Feb 11 10:00 ..
drwxr-xr-x  8 marco marco    4096 Feb 11 10:00 .git
-rwxr-xr-x  1 marco marco    3443 Feb 11 10:00 README.md
drwxr-xr-x 15 marco marco    4096 Feb 11 20:59 data
-rw-r--r--  1 marco marco    6755 Feb 11 10:00 docker-compose-completo-windows.yml
-rw-r--r--  1 marco marco    6381 Feb 11 10:00 docker-compose-completo.yml
-rw-r--r--  1 marco marco    5172 Feb 11 10:00 docker-compose-parcial.yml
-rwxr-xr-x  1 marco marco    3778 Feb 11 10:00 docker-compose.yml
-rw-r--r--  1 marco marco  343678 Feb 11 10:00 ecosystem.jpeg
drwxrwxrwx  3 root  root     4096 Feb 12 23:01 input
-rw-r--r--  1 marco marco 2796935 Feb 18 19:24 parquet-hadoop-bundle-1.6.0.jar
-rw-r--r--  1 marco marco     178 Feb 18 19:24 parquet-hadoop-bundle-1.6.0.jar:Zone.Identifier

marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker cp parquet-hadoop-bundle-1.6.0.jar spark:/opt/spark/jars
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$

## #Acessando o Spark

marco@DESKTOP-G2455QH:/mnt/c/Windows/system32$ cd ~/treinamentos/docker-bigdata
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker exec -it spark bash
root@spark:/#

## verificando o que temos aqui
root@spark:/# ls /opt/spark

LICENSE  NOTICE  R  README.md  RELEASE  bin  conf  data  examples  jars  kubernetes  licenses  logs  python  sbin  yarn

root@spark:/# ls /opt/spark/conf

docker.properties.template  hive-site.xml              metrics.properties.template  spark-defaults.conf.template
fairscheduler.xml.template  log4j.properties.template  slaves.template              spark-env.sh.template

root@spark:/# # Observamos que tem configuração do hive dentro do Spark para fazer a comunicação entre eles.
root@spark:/# # Dentro da pas /opt/jars tem varios packages: segurança, kafka,arquivos json, compressão.
root@spark:/# # vamos agora abrir o spark-shell lembrando que iremos trabalhar com a liguagem skala.

## Agora, vamos acessar o spark shell pois iremos usar a linguagem scala

root@spark:/# spark-shell
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
22/02/19 00:45:20 WARN spark.SparkConf: Note that spark.local.dir will be overridden by the value set by the cluster manager (via SPARK_LOCAL_DIRS in mesos/standalone/kubernetes and LOCAL_DIRS in YARN).
Spark context Web UI available at http://spark:4040
Spark context available as 'sc' (master = local[*], app id = local-1645231523887).
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

## Para sair do spark ctrl+d e CTRL +D



1. Enviar o diretório local “/input/exercises-data/juros_selic” para o HDFS em “/user/aluno/<nome>/data”

2. Criar o DataFrame jurosDF para ler o arquivo no HDFS “/user/aluno/<nome>/data/juros_selic/juros_selic.json”

3. Visualizar o Schema do jurosDF

4. Mostrar os 5 primeiros registros do jutosDF

5. Contar a quantidade de registros do jurosDF

6. Criar o DataFrame jurosDF10 para filtrar apenas os registros com o campo “valor” maior que 10

7. Salvar o DataFrame jurosDF10  como tabela Hive “<nome>.tab_juros_selic”

8. Criar o DataFrame jurosHiveDF para ler a tabela “<nome>.tab_juros_selic”

9. Visualizar o Schema do jurosHiveDF

10. Mostrar os 5 primeiros registros do jurosHiveDF

11. Salvar o DataFrame jurosHiveDF no HDFS no diretório “/user/aluno/nome/data/save_juros” no formato parquet

12. Visualizar o save_juros no HDFS

13. Criar o DataFrame jurosHDFS para ler o diretório do “save_juros” da questão 8

14. Visualizar o Schema do jurosHDFS

15. Mostrar os 5 primeiros registros do jurosHDFS

16. Clicar no botão de Enviar Tarefa, e enviar o texto: ok


