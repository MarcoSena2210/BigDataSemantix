# instalação do elatic no docker

* Criando uma pasta chamada elatic. 
marco@DESKTOP-G2455QH:~/treinamentos$ <code> mkdir elastic </code>


* Indo para pasta criada
marco@DESKTOP-G2455QH:~/treinamentos$<code> cd elastic  </code>


# Preparação Ambiente Cluster Elastic

* Download da imagem: https://www.docker.elastic.co/
* docker pull docker.elastic.co/elasticsearch/elasticsearch:7.9.2-amd64
* docker pull docker.elastic.co/ kibana /kibana:7.9.2
* docker pull docker.elastic.co/ logstash /logstash:7.9.2
* Setar o vm.max_map_count com no mínimo 262144
* Criar docker compose.yml e os arquivos de configuração para facilitar o gerenciamento do elastic


* 1ª) Fazendo o download do elasticsearch


marco@DESKTOP-G2455QH:~/treinamentos/,elastic$ <code> docker pull docker.elastic.co/elasticsearch/elasticsearch:7.9.2-amd64 </code>

Retorna:


<prev>
7.9.2-amd64: Pulling from elasticsearch/elasticsearch
f1feca467797: Pull complete
2b669da077a4: Pull complete
e5b4c466fc6d: Pull complete
3b660c013f1a: Pull complete
0e7ad1133ad1: Pull complete
b50d6e48f432: Pull complete
bff3705905f9: Pull complete
9509765886ad: Pull complete
b7f06f509306: Pull complete
Digest: sha256:d86cf5c3dc4086c2dc12f20321695144e7fdcf7fd1d117c16c054fa5e2ed4083
Status: Downloaded newer image for docker.elastic.co/elasticsearch/elasticsearch:7.9.2-amd64
docker.elastic.co/elasticsearch/elasticsearch:7.9.2-amd64
marco@DESKTOP-G2455QH:~/treinamentos/elastic$
</prev>


* 2º) Fazendo o download do kibana

marco@DESKTOP-G2455QH:~/treinamentos/elastic$ <code> docker pull docker.elastic.co/kibana/kibana:7.9.2
</code>


Retorna:

<prev>

7.9.2: Pulling from kibana/kibana
f1feca467797: Already exists
931233f554d6: Pull complete
581a489dbecb: Pull complete
aa6fbd91b2db: Pull complete
bff28ae590a6: Pull complete
ad686c2de296: Pull complete
65ff4ca7a663: Pull complete
f0eefcb039b2: Pull complete
a742df43ef13: Pull complete
6f64f5502816: Pull complete
3bffd6feec15: Pull complete
Digest: sha256:48d7d2e91b7903321748432e22a01576c7e4db539021836b54bd58d5659aa5e5
Status: Downloaded newer image for docker.elastic.co/kibana/kibana:7.9.2
docker.elastic.co/kibana/kibana:7.9.2
marco@DESKTOP-G2455QH:~/treinamentos/elastic$
</prev>

* 3º) Fazendo o download do kibana logstash:7.9.


marco@DESKTOP-G2455QH:~/treinamentos/elastic$ <code>  docker pull docker.elastic.co/logstash/2logstash:7.9. </code>

<prev>
7.9.2: Pulling from logstash/logstash
f1feca467797: Already exists
22fdec40f1c0: Pull complete
c28c84c9e5c7: Pull complete
1d1287f5a060: Pull complete
0afab2e978b8: Pull complete
d51d089eccd4: Pull complete
73d0d31b4de2: Pull complete
994fac792cb1: Pull complete
340e8ebd0411: Pull complete
8533ba55b320: Pull complete
176d22ffad29: Pull complete
Digest: sha256:f2c9d6d0fcd63cdb2a44dea7e9af1ccd6cc388a8af409fa66865abcab64b2c61
Status: Downloaded newer image for docker.elastic.co/logstash/logstash:7.9.2
docker.elastic.co/logstash/logstash:7.9.2
marco@DESKTOP-G2455QH:~/treinamentos/elastic$
</prev>




4º) Setar o vm.max_map_count com no mínimo 262144. 
* Windows Docker Desktop com WSL2


PS C:\Windows\system32><code>  wsl -d docker-desktop </code>
DESKTOP-G2455QH:/mnt/host/c/Windows/system32# <code>  sysctl -w vm.max_map_count=262144 </code>

Retorna:

<prev>
vm.max_map_count = 262144
DESKTOP-G2455QH:/mnt/host/c/Windows/system32# </prev>


* 5º) Baixar o diretório elastic na guia arquivos da plataforma

Dica: Foi baixado para o ambiente windows.Vamos digitar \\wsl$ na barra iniciar do windows 10.Abrirá o explorer no ambiente linux. 
Vamos clicar na pasta: Ubuntu-20.04\home\marco\treinamentos\elastic

(\\wsl$\Ubuntu-20.04\home\marco\treinamentos\elastic)

* Copiar para pasta acima (CTRL C e CTRL V) do ambiente windos para o ambiente Linux.

* A estrutura ficará assim:
<prev>

elastic
   
   <prev>
   * docker compose.yml
   </prev>

   settings
        elasticsearch.yml
        kibana.yml
        Logstash.yml
Pipeline
    logstash.conf
</prev>
<div>
<imag src="\Engenharia_dados\Semantix\BigDataSemantix\elastic\course_image\estrutura_pasta_elastic.png"/>
</div>


## Iniciar todos os serviços em background (-d)

<code>
docker compose up -d
</code>

Resposta:


<prev>
marco@DESKTOP-G2455QH:~/treinamentos/elastic$ docker-compose up -d
Creating network "elastic_elastic" with driver "bridge"
Creating volume "elastic_es-data" with local driver
Pulling elasticsearch (docker.elastic.co/elasticsearch/elasticsearch:7.9.2)...
7.9.2: Pulling from elasticsearch/elasticsearch
Digest: sha256:2be3302537236874fdeca184c78a49aed17d5aca0f8fc3f6192a80e93e817cb4
Status: Downloaded newer image for docker.elastic.co/elasticsearch/elasticsearch:7.9.2
Creating elastic_elasticsearch_1 ... done
Creating elastic_kibana_1        ... done
Creating elastic_logstash_1      ... done
marco@DESKTOP-G2455QH:~/treinamentos/elastic$
</prev>




* Parar os serviços
<code>
docker compose stop
</code>
* Iniciar os serviços
<code>docker compose start</code>

## Término do treinamento

<code>

* Matar os serviços
<code>docker compose dowm </code>

* Apagar todos os volumes sem uso
<code>docker volume prune</code>


## Visualizar os container

* Ativos
<code> docker ps </code>

* Todos
<code>
 docker ps a
</code>

* Executar comandos no container

<code> docker exec it <container> <comando>
</code>

* Visualizar os logs

<code> docker logs <container>
</code>
<code> Docker compose logs
</code>

* Enviar arquivos
<code> docker cp <diretório> <container>:/<diretorio>

</code>