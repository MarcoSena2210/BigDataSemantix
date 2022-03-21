
# BIG DATA - ACESSANDO O HIVE NO DOCKER ATRAVÉS DO BEELINE

Nesse cenário, já existe o docker instalado e com todas as imagens dos seriços em que vamos usar,vamos acessar o hive através do beeline.

Esse material faz parte do aprendizado dispinível na vídeo aula do professor Rodrigo Rebousas, ministrado no curso de BIG DATA DA seamntix.

Optei por deixar o prompt de comando, para uma melhor sinalização do ambiente em que estamos.Também foi uma opção deixar o incidente  que porventura ocorra, para poder descrever a solução adotada.


1º Acessar o power shell como admisnitrado
2º Ir para o diretório onde está instalado o docker.
marco@DESKTOP-G2455QH:~$ cd treinamentos/
marco@DESKTOP-G2455QH:~/treinamentos$ cd docker-bigdata/
3º Verificar se o seu cluster está em ativo
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker ps
Retorno 
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
4º Sobe os serviços 
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker-compose up -d

Starting database ...
Starting spark    ...
Starting zookeeper ...
Starting namenode  ... error
Starting database  ... done
Starting spark     ... done
Starting zookeeper ... done
s permissões de acesso.

ERROR: for namenode  Cannot start service namenode: Ports are not available: listen tcp 0.0.0.0:50070: bind: Foi feita uma tentativa de acesso a um soquete de uma maneira que é proibida pelas permissões de acesso.
ERROR: Encountered errors while bringing up the project.
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$

## Solução:
Abrar outro terminal como Administrador e digite os comandos abaixo: 
C:\Windows\system32> net stop winnat (desabilita o serviço winnat)
C:\Windows\system32> docker start namenode   (Habilita  o serviço namenode do doicker)
C:\Windows\system32> net start winnat  (Habilita o serviço winnat    )

## No primeiro terminal do power shell que estávamos trabalhando com o Docker,
## reinicie os contêineres
 	marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker-compose restart 

## Verificando resultado os serviços:
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker ps -a
CONTAINER ID   IMAGE                    COMMAND                  CREATED      STATUS              PORTS                                                                                                                NAMES
3fdbb6bf2448   fjardim/hive             "entrypoint.sh /bin/…"   3 days ago   Up 32 seconds             0.0.0.0:10000->10000/tcp, :::10000->10000/tcp, 10002/tcp                                                             hive-server
4bc92511323e   fjardim/hive             "entrypoint.sh /opt/…"   3 days ago   Up 44 seconds             10000/tcp, 0.0.0.0:9083->9083/tcp, :::9083->9083/tcp, 10002/tcp                                                      hive_metastore
5a179daa9442   fjardim/hive-metastore   "/docker-entrypoint.…"   3 days ago   Up 45 seconds             5432/tcp                                                                                                             hive-metastore-postgresql
6f1c99356533   fjardim/datanode         "/entrypoint.sh /run…"   3 days ago   Up 32 seconds (healthy)   0.0.0.0:50075->50075/tcp, :::50075->50075/tcp                                                                        datanode
b43b844d51ef   fjardim/hbase-master     "/entrypoint.sh /run…"   3 days ago   Up 34 seconds             16000/tcp, 0.0.0.0:16010->16010/tcp, :::16010->16010/tcp                                                             hbase-master
6b023eefd9df   fjardim/zookeeper        "/bin/sh -c '/usr/sb…"   3 days ago   Up 32 seconds             22/tcp, 2888/tcp, 3888/tcp, 0.0.0.0:2181->2181/tcp, :::2181->2181/tcp                                                zookeeper
e5b72cb600ba   fjardim/namenode_sqoop   "/entrypoint.sh /run…"   3 days ago   Up 34 seconds (healthy)   0.0.0.0:50070->50070/tcp, :::50070->50070/tcp                                                                        namenode
b0ab05bb0502   fjardim/mysql            "docker-entrypoint.s…"   3 days ago   Up 44 seconds             33060/tcp, 0.0.0.0:33061->3306/tcp, :::33061->3306/tcp                                                               database
7e31a50b8527   fjardim/jupyter-spark    "/opt/docker/bin/ent…"   3 days ago   Up 30 seconds             0.0.0.0:4040-4043->4040-4043/tcp, :::4040-4043->4040-4043/tcp, 0.0.0.0:8889->8889/tcp, :::8889->8889/tcp, 8899/tcp   spark


<br> Nesse ponto vamos acessar o  hive-server, e lá dentro vamos acessar nosso cliente beeline.Iremos chamar o Help para obter um breve conhecimento dos seus comandos.  
<br>  


marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker exec -it hive-server bash
root@hive_server:/opt#

## Usando o comando do help
root@hive_server:/opt# beeLine --help
bash: beeLine: command not found
root@hive_server:/opt# beeLine --help
bash: beeLine: command not found
root@hive_server:/opt#
root@hive_server:/opt# beeLine -help
bash: beeLine: command not found
root@hive_server:/opt# beeLine
bash: beeLine: command not found

root@hive_server:/opt# BeeLine --help
bash: BeeLine: command not found
root@hive_server:/opt# ls -a
.  ..  hadoop-2.7.4  hive
root@hive_server:/opt# beeline --help
Usage: java org.apache.hive.cli.beeline.BeeLine
   -u <database url>               the JDBC URL to connect to
   -r                              reconnect to last saved connect url (in conjunction with !save)
   -n <username>                   the username to connect as
   -p <password>                   the password to connect as
   -d <driver class>               the driver class to use
   -i <init file>                  script file for initialization
   -e <query>                      query that should be executed
   -f <exec file>                  script file that should be executed
   -w (or) --password-file <password file>  the password file to read password from
   --hiveconf property=value       Use value for given property
   --hivevar name=value            hive variable name and value
                                   This is Hive specific settings in which variables
                                   can be set at session level and referenced in Hive
                                   commands or queries.
   --property-file=<property-file> the file to read connection properties (url, driver, user, password) from
   --color=[true/false]            control whether color is used for display
   --showHeader=[true/false]       show column names in query results
   --headerInterval=ROWS;          the interval between which heades are displayed
   --fastConnect=[true/false]      skip building table/column list for tab-completion
   --autoCommit=[true/false]       enable/disable automatic transaction commit
   --verbose=[true/false]          show verbose error messages and debug info
   --showWarnings=[true/false]     display connection warnings
   --showDbInPrompt=[true/false]   display the current database name in the prompt
   --showNestedErrs=[true/false]   display nested errors
   --numberFormat=[pattern]        format numbers using DecimalFormat pattern
   --force=[true/false]            continue running script even after errors
   --maxWidth=MAXWIDTH             the maximum width of the terminal
   --maxColumnWidth=MAXCOLWIDTH    the maximum width to use when displaying columns
   --silent=[true/false]           be more silent
   --autosave=[true/false]         automatically save preferences
   --outputformat=[table/vertical/csv2/tsv2/dsv/csv/tsv]  format mode for result display
                                   Note that csv, and tsv are deprecated - use csv2, tsv2 instead
   --incremental=[true/false]      Defaults to false. When set to false, the entire result set
                                   is fetched and buffered before being displayed, yielding optimal
                                   display column sizing. When set to true, result rows are displayed
                                   immediately as they are fetched, yielding lower latency and
                                   memory usage at the price of extra display column padding.
                                   Setting --incremental=true is recommended if you encounter an OutOfMemory
                                   on the client side (due to the fetched result set size being large).
                                   Only applicable if --outputformat=table.
   --incrementalBufferRows=NUMROWS the number of rows to buffer when printing rows on stdout,
                                   defaults to 1000; only applicable if --incremental=true
                                   and --outputformat=table
   --truncateTable=[true/false]    truncate table column when it exceeds length
   --delimiterForDSV=DELIMITER     specify the delimiter for delimiter-separated values output format (default: |)
   --isolation=LEVEL               set the transaction isolation level
   --nullemptystring=[true/false]  set to true to get historic behavior of printing null as empty string
   --maxHistoryRows=MAXHISTORYROWS The maximum number of rows to store beeline history.
   --help                          display this message

   Example:
    1. Connect using simple authentication to HiveServer2 on localhost:10000
    $ beeline -u jdbc:hive2://localhost:10000 username password

    2. Connect using simple authentication to HiveServer2 on hs.local:10000 using -n for username and -p for password
    $ beeline -n username -p password -u jdbc:hive2://hs2.local:10012

    3. Connect using Kerberos authentication with hive/localhost@mydomain.com as HiveServer2 principal
    $ beeline -u "jdbc:hive2://hs2.local:10013/default;principal=hive/localhost@mydomain.com"

    4. Connect using SSL connection to HiveServer2 on localhost at 10000
    $ beeline "jdbc:hive2://localhost:10000/default;ssl=true;sslTrustStore=/usr/local/truststore;trustStorePassword=mytruststorepassword"

    5. Connect using LDAP authentication
    $ beeline -u jdbc:hive2://hs2.local:10013/default <ldap-username> <ldap-password>


## Estabelecendo a conexão:
root@hive_server:/opt#  beeline -u jdbc:hive2://localhost:10000

### *OBS: Na linha do comando acima, temos um cliente beeline se conectando através do drive jdbc ao server hive2 que está no localhost pela porta 10000.

### Após a execuçaõ do camando observamos várias informações que poderão nos ajudar paraalguma ocasião.Tipo versão  

Retorno do comando:
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


### Exibindo os bancos:
      ...jdbc:hive2://localhost:10000> show databases;
+----------------+
| database_name  |
+----------------+
| default        |
+----------------+
1 row selected (0.162 seconds)
0: jdbc:hive2://localhost:10000>

*OBS: Se não for exibido a database, existe algum erro de conexão. 

## Para sair da conexão (beeline):
    ctrl + d  (Observe que voltamos para o Hive )

    0: jdbc:hive2://localhost:10000> Closing: 0: jdbc:hive2://localhost:10000
root@hive_server:/opt#

## Para sair do hive:
ctrl + d  (Observe que voltamos para o Hive )
Retorno:
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$

## Supondo que vamos encerrar nossos estudo por enquanto, para econimizar recursos da nossa máquina, vamos encerrar os serviços do docker;
marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker-compose stop
Stopping hive-server               ... done
Stopping hive_metastore            ... done
Stopping hive-metastore-postgresql ... done
Stopping datanode                  ... done
Stopping hbase-master              ... done
Stopping zookeeper                 ... done
Stopping namenode                  ...
Stopping database                  ... done
Stopping spark                     ... done

