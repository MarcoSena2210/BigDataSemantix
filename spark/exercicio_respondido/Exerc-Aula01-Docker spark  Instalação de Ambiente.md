# Exercícios - Instalação de Ambiente Docker 

* Verificando o que está rodando:
marco@DESKTOP-G2455QH:~/treinamentos$ docker ps -a

The command 'docker' could not be found in this WSL 2 distro.
We recommend to activate the WSL integration in Docker Desktop settings.

See https://docs.docker.com/docker-for-windows/wsl/ for details.

marco@DESKTOP-G2455QH:~/treinamentos$ logout
PS C:\Windows\system32> wsl --set-default-version 2
Para obter informações sobre as principais diferenças em relação ao WSL 2, visite https://aka.ms/wsl2
A operação foi concluída com êxito.
PS C:\Windows\system32> wsl -l -v
  NAME                   STATE           VERSION
* Ubuntu-20.04           Stopped         2
  docker-desktop         Stopped         2
  docker-desktop-data    Stopped         2
PS C:\Windows\system32>

# Para definir o wsl2 para a distribuição linux
PS C:\Windows\system32> wsl --set-version Ubuntu-20.04 2
Conversão em andamento. Isso pode levar alguns minutos...
Para obter informações sobre as principais diferenças em relação ao WSL 2, visite https://aka.ms/wsl2
A distribuição já é a versão solicitada.
PS C:\Windows\system32>

## 1. Instalação do docker e docker-compose
<code></code>  
Exibe: 
<prev></prev>  

## 2. Executar os seguintes comandos, para baixar as imagens do Cluster de Big Data:
git clone https://github.com/rodrigo-reboucas/docker-bigdata.git spark
cd spark
docker-compose –f docker-compose-parcial.yml pull

marco@DESKTOP-G2455QH:~/treinamentos$ <code>sudo git clone https://github.com/rodrigo-reboucas/docker-bigdata.git spark</code>  

Exibe:

<prev>
[sudo] password for marco:
Cloning into 'spark'...
remote: Enumerating objects: 1318, done.
remote: Counting objects: 100% (508/508), done.
remote: Compressing objects: 100% (116/116), done.
remote: Total 1318 (delta 468), reused 392 (delta 392), pack-reused 810
Receiving objects: 100% (1318/1318), 129.65 MiB | 7.71 MiB/s, done.
Resolving deltas: 100% (869/869), done.
Updating files: 100% (710/710), done.
</prev> 

## Listando os diretorios
marco@DESKTOP-G2455QH:~/treinamentos$<code> ls -la </code>

<prev>  
total 36
drwxr-xr-x 9 marco marco 4096 Apr  4 22:02 .
drwxr-xr-x 7 marco marco 4096 Mar 31 21:35 ..
drwxr-xr-x 7 marco marco 4096 Mar  3 13:23 docker-bigdata
drwxr-xr-x 9 marco marco 4096 Mar 31 21:24 elastic
drwxr-xr-x 2 marco marco 4096 Mar  3 13:18 kafka
drwxr-xr-x 2 marco marco 4096 Feb 22 21:36 mongodb
drwxr-xr-x 2 marco marco 4096 Mar 28 21:12 nginx
drwxr-xr-x 2 marco marco 4096 Mar 14 21:55 redis
drwxr-xr-x 4 root  root  4096 Apr  4 22:03 spark
marco@DESKTOP-G2455QH:~/treinamentos$
</prev>  

## Entrando no diretorio spark
marco@DESKTOP-G2455QH:~/treinamentos$ <code>  cd spark </code>
## Verificando o que tem.
marco@DESKTOP-G2455QH:~/treinamentos/spark$ <code>  ls -la </code>

Exibe:
<prev>
total 384
drwxr-xr-x  4 root  root    4096 Apr  4 22:03 .
drwxr-xr-x  9 marco marco   4096 Apr  4 22:02 ..
drwxr-xr-x  8 root  root    4096 Apr  4 22:03 .git
-rwxr-xr-x  1 root  root    3443 Apr  4 22:03 README.md
drwxr-xr-x 12 root  root    4096 Apr  4 22:03 data
-rw-r--r--  1 root  root    6755 Apr  4 22:03 docker-compose-completo-windows.yml
-rw-r--r--  1 root  root    6381 Apr  4 22:03 docker-compose-completo.yml
-rw-r--r--  1 root  root    5172 Apr  4 22:03 docker-compose-parcial.yml
-rwxr-xr-x  1 root  root    3778 Apr  4 22:03 docker-compose.yml
-rw-r--r--  1 root  root  343678 Apr  4 22:03 ecosystem.jpeg
marco@DESKTOP-G2455QH:~/treinamentos/spark$
</prev>


marco@DESKTOP-G2455QH:~/treinamentos/spark$ docker-compose –f docker-compose-parcial.yml pull

The command 'docker-compose' could not be found in this WSL 2 distro.
We recommend to activate the WSL integration in Docker Desktop settings.

See https://docs.docker.com/docker-for-windows/wsl/ for details.


# Dica :Solução: Entrar no menu iniciar do windows--> digitar docker-desktop--> configurações-->recursos-->marcar start docker when you log in e clicar em applay & restart;     

marco@DESKTOP-G2455QH:~/treinamentos/spark$<code>  docker-compose -f docker-compose-parcial.yml pull 
 </code> 
Exibe:

<prev>
Pulling namenode                  ... done
Pulling datanode                  ... done
Pulling hive-metastore-postgresql ... done
Pulling hive-metastore            ... done
Pulling hive-server               ... done
Pulling database                  ... done
Pulling zookeeper                 ... done
Pulling kafka                     ... done
Pulling hbase-master              ... done
Pulling mongo                     ... done
Pulling mongo-express             ... done
Pulling kafkamanager              ... done
Pulling jupyter-spark             ... done
marco@DESKTOP-G2455QH:~/treinamentos/spark$
</prev>

## 3. Iniciar o cluster Hadoop através do docker-compose
docker-compose –f docker-compose-parcial.yml up -d

marco@DESKTOP-G2455QH:~/treinamentos/spark$ 
<code>
docker-compose -f docker-compose-parcial.yml up -d
</code>  
Exibe:
<prev>
Creating network "spark_default" with the default driver
Creating jupyter-spark ...
Creating zookeeper     ... error
Creating mongo         ...
Creating jupyter-spark ... done
Creating mongo_express ...
Creating mongo         ... done
Creating database      ... done
Creating mongo_express ... done
Creating namenode      ... done
Creating datanode      ... done
Creating hbase-master              ... done
Creating hive-metastore-postgresql ... done
Creating hive_metastore            ... done
Creating hive-server               ... done

ERROR: for zookeeper  Cannot create container for service zookeeper: Conflict. The container name "/zookeeper" is already in use by container "6eec5db33d75b46e4898f7a48f30d6b0532bbaadf4b24e1ee9915d3a94781646". You have to remove (or rename) that container to be able to reuse that name.
ERROR: Encountered errors while bringing up the project.
marco@DESKTOP-G2455QH:~/treinamentos/spark$
</prev>  





## 4. Listas as imagens em execução
marco@DESKTOP-G2455QH:~/treinamentos/spark$<code>docker ps</code>  
Exibe: 
<prev> 
CONTAINER ID   IMAGE                    COMMAND                  CREATED         STATUS                   PORTS                                                                                                                NAMES
e46eeec152f2   fjardim/hive             "entrypoint.sh /bin/…"   4 minutes ago   Up 4 minutes             0.0.0.0:10000->10000/tcp, :::10000->10000/tcp, 10002/tcp                                                             hive-server
fbd60a92fe7f   fjardim/hive             "entrypoint.sh /opt/…"   4 minutes ago   Up 4 minutes             10000/tcp, 0.0.0.0:9083->9083/tcp, :::9083->9083/tcp, 10002/tcp                                                      hive_metastore
6974dec85f0f   fjardim/hive-metastore   "/docker-entrypoint.…"   5 minutes ago   Up 4 minutes             5432/tcp                                                                                                             hive-metastore-postgresql
3fbece510f92   fjardim/datanode         "/entrypoint.sh /run…"   5 minutes ago   Up 5 minutes (healthy)   0.0.0.0:50075->50075/tcp, :::50075->50075/tcp                                                                        datanode
315815241b8c   fjardim/mysql            "docker-entrypoint.s…"   5 minutes ago   Up 5 minutes             33060/tcp, 0.0.0.0:33061->3306/tcp, :::33061->3306/tcp                                                               database
403e5a567c4f   fjardim/namenode_sqoop   "/entrypoint.sh /run…"   5 minutes ago   Up 5 minutes (healthy)   0.0.0.0:50070->50070/tcp, :::50070->50070/tcp                                                                        namenode
727491f1f4f2   fjardim/mongo-express    "tini -- /docker-ent…"   5 minutes ago   Up 4 minutes             0.0.0.0:8081->8081/tcp, :::8081->8081/tcp                                                                            mongo_express
50d30523a1e7   fjardim/mongo            "docker-entrypoint.s…"   5 minutes ago   Up 5 minutes             0.0.0.0:27017->27017/tcp, :::27017->27017/tcp                                                                        mongo
9c32ce459a83   fjardim/jupyter-spark    "/opt/docker/bin/ent…"   5 minutes ago   Up 5 minutes             0.0.0.0:4040-4043->4040-4043/tcp, :::4040-4043->4040-4043/tcp, 0.0.0.0:8889->8889/tcp, :::8889->8889/tcp, 8899/tcp   jupyter-spark
marco@DESKTOP-G2455QH:~/treinamentos/spark$</prev>  

## 5. Verificar os logs dos containers do docker-compose em execução

marco@DESKTOP-G2455QH:~/treinamentos/spark$ <code> docker-compose logs -f</code>  
Resposta: 
<prev>
Mostra o log
</prev>  

## 6. Verificar os logs do container jupyter-spark
marco@DESKTOP-G2455QH:~/treinamentos/spark$<code>docker logs jupyter-spark</code>  
Resposta: 
<prev> 
/opt/docker/conf/hadoop/capacity-scheduler.xml => /etc/hadoop/capacity-scheduler.xml
/opt/docker/conf/hadoop/core-site.xml => /etc/hadoop/core-site.xml
/opt/docker/conf/hadoop/hadoop-env.sh => /etc/hadoop/hadoop-env.sh
/opt/docker/conf/hadoop/hdfs-site.xml => /etc/hadoop/hdfs-site.xml
/opt/docker/conf/hadoop/mapred-site.xml => /etc/hadoop/mapred-site.xml
/opt/docker/conf/hadoop/yarn-site.xml => /etc/hadoop/yarn-site.xml
/opt/docker/conf/spark/spark-defaults.conf => /etc/spark/spark-defaults.conf
/opt/docker/conf/jupyter-kernels/PySpark/kernel.json => /opt/anaconda3/share/jupyter/kernels/PySpark/kernel.json
[W 01:40:44.733 NotebookApp] All authentication is disabled.  Anyone who can connect to this server will be able to run code.
[I 01:40:44.820 NotebookApp] JupyterLab beta preview extension loaded from /opt/anaconda3/lib/python3.6/site-packages/jupyterlab
[I 01:40:44.820 NotebookApp] JupyterLab application directory is /opt/anaconda3/share/jupyter/lab
[I 01:40:44.838 NotebookApp] Serving notebooks from local directory: /mnt/notebooks
[I 01:40:44.838 NotebookApp] 0 active kernels
[I 01:40:44.838 NotebookApp] The Jupyter Notebook is running at:
[I 01:40:44.838 NotebookApp] http://jupyter-spark:8889/
[I 01:40:44.838 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
marco@DESKTOP-G2455QH:~/treinamentos/spark$</prev>  

## 7. Acessar pelo browser o Jupyter, através do link:
<code>http://localhost:8889/</code>  
Resposta: 
<prev>
![Imagem da interface gráfica](01-acesso a pagna do jupyte.png)</prev>  

http://localhost:8889 (Links para um site externo.)


## 8. Clicar no botão de Enviar Tarefa, e enviar o texto: ok