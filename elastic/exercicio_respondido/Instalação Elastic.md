# Exerc-Aula01-Elastic-Instalação Elastic

## 1. Baixar a pasta elastic na Guia Arquivos do treinamento

## 2. Instalação do docker e docker-compose

Docker: https://docs.docker.com/get-docker/ (Links para um site externo.)
Docker-compose: https://docs.docker.com/compose/install/ (Links para um site externo.)

## 3. Executar os seguintes comandos, para baixar as imagens de Elastic:

docker pull docker.elastic.co/elasticsearch/elasticsearch:7.9.2
docker pull docker.elastic.co/kibana/kibana:7.9.2
docker pull docker.elastic.co/logstash/logstash:7.9.2
***************************************************************

* 1ª) Fazendo o download do elasticsearch


marco@DESKTOP-G2455QH:~/treinamentos/elastic$ <code> docker pull docker.elastic.co/elasticsearch/elasticsearch:7.9.2-amd64 </code>

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




## 4. Setar na máquina o vm.max_map_count com no mínimo 262144

https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_set_vm_max_map_count_to_at_least_262144 (Links para um site externo.)

Usando wsl no windows:

* Windows Docker Desktop com WSL2


PS C:\Windows\system32><code>  wsl -d docker-desktop </code> 



DESKTOP-G2455QH:/mnt/host/c/Windows/system32# <code>sysctl -w vm.max_map_count=262144 </code>

Retorna:

<prev>
vm.max_map_count = 262144
DESKTOP-G2455QH:/mnt/host/c/Windows/system32# </prev>


## 5. Iniciar o cluster Elastic através do docker-compose
marco@DESKTOP-G2455QH:~/treinamentos/elastic$ <code> docker-compose up -d </code>

Retorna:

<prev>
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


## 6. Listas as imagens em execução

marco@DESKTOP-G2455QH:~/treinamentos/elastic$ <code> docker ps </code>

Retorna:

CONTAINER ID| IMAGE        |                                         COMMAND|                  CREATED|       STATUS      | PORTS               |                       NAMES


4d8a1a2aeb9c   docker.elastic.co/logstash/logstash:7.9.2             "/usr/local/bin/dock…"   7 hours ago   Up 7 hours   0.0.0.0:5044->5044/tcp, :::5044->5044/tcp, 0.0.0.0:9600->9600/tcp, :::9600->9600/tcp   elastic_logstash_1


daaa96cc814b   docker.elastic.co/kibana/kibana:7.9.2                 "/usr/local/bin/dumb…"   7 hours ago   Up 7 hours   0.0.0.0:5601->5601/tcp, :::5601->5601/tcp                                              elastic_kibana_1


affccce169a2   docker.elastic.co/elasticsearch/elasticsearch:7.9.2   "/tini -- /usr/local…"   7 hours ago   Up 7 hours   0.0.0.0:9200->9200/tcp, :::9200->9200/tcp, 9300/tcp                                    elastic_elasticsearch_1
marco@DESKTOP-G2455QH:~/treinamentos/elastic$
<prev>


## 7. Verificar os logs dos containers em execução
**********   logs elastic_logstash_1 *************

marco@DESKTOP-G2455QH:~/treinamentos/elastic$ <code>docker logs elastic_logstash_1 </code>

<prev>
OpenJDK 64-Bit Server VM warning: Option UseConcMarkSweepGC was deprecated in version 9.0 and will likely be removed in a future release.
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by org.jruby.ext.openssl.SecurityHelper (file:/tmp/jruby-1/jruby278947877763773665jopenssl.jar) to field java.security.MessageDigest.provider
WARNING: Please consider reporting this to the maintainers of org.jruby.ext.openssl.SecurityHelper
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
Sending Logstash logs to /usr/share/logstash/logs which is now configured via log4j2.properties
[2022-03-22T10:52:06,709][INFO ][logstash.runner          ] Starting Logstash {"logstash.version"=>"7.9.2", "jruby.version"=>"jruby 9.2.13.0 (2.5.7) 2020-08-03 9a89c94bcc OpenJDK 64-Bit Server VM 11.0.8+10-LTS on 11.0.8+10-LTS +indy +jit [linux-x86_64]"}
[2022-03-22T10:52:06,795][INFO ][logstash.setting.writabledirectory] Creating directory {:setting=>"path.queue", :path=>"/usr/share/logstash/data/queue"}
[2022-03-22T10:52:06,814][INFO ][logstash.setting.writabledirectory] Creating directory {:setting=>"path.dead_letter_queue", :path=>"/usr/share/logstash/data/dead_letter_queue"}
[2022-03-22T10:52:07,501][INFO ][logstash.agent           ] No persistent UUID file found. Generating new UUID {:uuid=>"327201e6-8926-458b-8ae8-3cc2e2645625", :path=>"/usr/share/logstash/data/uuid"}
[2022-03-22T10:52:11,138][INFO ][org.reflections.Reflections] Reflections took 92 ms to scan 1 urls, producing 22 keys and 45 values
[2022-03-22T10:52:13,212][INFO ][logstash.outputs.elasticsearch][main] Elasticsearch pool URLs updated {:changes=>{:removed=>[], :added=>[http://elasticsearch:9200/]}}
[2022-03-22T10:52:14,105][WARN ][logstash.outputs.elasticsearch][main] Restored connection to ES instance {:url=>"http://elasticsearch:9200/"}
[2022-03-22T10:52:14,273][INFO ][logstash.outputs.elasticsearch][main] ES Output version determined {:es_version=>7}
[2022-03-22T10:52:14,279][WARN ][logstash.outputs.elasticsearch][main] Detected a 6.x and above cluster: the `type` event field won't be used to determine the document _type {:es_version=>7}
[2022-03-22T10:52:14,602][INFO ][logstash.outputs.elasticsearch][main] New Elasticsearch output {:class=>"LogStash::Outputs::ElasticSearch", :hosts=>["//elasticsearch:9200"]}
[2022-03-22T10:52:14,792][INFO ][logstash.outputs.elasticsearch][main] Using a default mapping template {:es_version=>7, :ecs_compatibility=>:disabled}
[2022-03-22T10:52:14,934][INFO ][logstash.javapipeline    ][main] Starting pipeline {:pipeline_id=>"main", "pipeline.workers"=>4, "pipeline.batch.size"=>125, "pipeline.batch.delay"=>50, "pipeline.max_inflight"=>500, "pipeline.sources"=>["/usr/share/logstash/pipeline/logstash.conf"], :thread=>"#<Thread:0x22a1450f run>"}
[2022-03-22T10:52:14,969][INFO ][logstash.outputs.elasticsearch][main] Attempting to install template {:manage_template=>{"index_patterns"=>"logstash-*", "version"=>60001, "settings"=>{"index.refresh_interval"=>"5s", "number_of_shards"=>1}, "mappings"=>{"dynamic_templates"=>[{"message_field"=>{"path_match"=>"message", "match_mapping_type"=>"string", "mapping"=>{"type"=>"text", "norms"=>false}}}, {"string_fields"=>{"match"=>"*", "match_mapping_type"=>"string", "mapping"=>{"type"=>"text", "norms"=>false, "fields"=>{"keyword"=>{"type"=>"keyword", "ignore_above"=>256}}}}}], "properties"=>{"@timestamp"=>{"type"=>"date"}, "@version"=>{"type"=>"keyword"}, "geoip"=>{"dynamic"=>true, "properties"=>{"ip"=>{"type"=>"ip"}, "location"=>{"type"=>"geo_point"}, "latitude"=>{"type"=>"half_float"}, "longitude"=>{"type"=>"half_float"}}}}}}}
[2022-03-22T10:52:15,043][INFO ][logstash.outputs.elasticsearch][main] Installing elasticsearch template to _template/logstash
[2022-03-22T10:52:17,340][INFO ][logstash.javapipeline    ][main] Pipeline Java execution initialization time {"seconds"=>2.4}
[2022-03-22T10:52:17,384][INFO ][logstash.inputs.beats    ][main] Beats inputs: Starting input listener {:address=>"0.0.0.0:5044"}
[2022-03-22T10:52:17,420][INFO ][logstash.javapipeline    ][main] Pipeline started {"pipeline.id"=>"main"}
[2022-03-22T10:52:17,625][INFO ][logstash.agent           ] Pipelines running {:count=>1, :running_pipelines=>[:main], :non_running_pipelines=>[]}
[2022-03-22T10:52:17,827][INFO ][org.logstash.beats.Server][main][f1ac2d61021bcee056f574dd56d3e981f3ac189f507287f6af4198da501cc3db] Starting server on port: 5044
[2022-03-22T10:52:18,326][INFO ][logstash.agent           ] Successfully started Logstash API endpoint {:port=>9600}
marco@DESKTOP-G2455QH:~/treinamentos/elastic$
<prev>

-------------------------------------------------------------
OU 
marco@DESKTOP-G2455QH:~/treinamentos/elastic$<code>docker-compose logs
</code>

Retorna: (Um lista inorme com log de todos os serviços.) 

<prev>
Attaching to elastic_logstash_1, elastic_kibana_1, elastic_elasticsearch_1
kibana_1         | {"type":"log","@timestamp":"2022-03-22T10:51:10Z","tags":["warning","plugins-discovery"],"pid":7,"message":"Expect plugin \"id\" in camelCase, but found: beats_management"}
kibana_1         | {"type":"log","@timestamp":"2022-03-22T10:51:10Z","tags":["warning","plugins-discovery"],"pid":7,"message":"Expect plugin \"id\" in camelCase, but found: triggers_actions_ui"}
kibana_1         | [BABEL] Note: The code generator has deoptimised the styling of /usr/share/kibana/x-pack/plugins/canvas/server/templates/pitch_presentation.js as it exceeds the max of 500KB
.... Continua uma lista enorme com logde todos os serviços.................... . 

</prev>


## 8. Verificar as informações do cluster através do browser:

http://localhost:9200/ (Links para um site externo.)

<prev>
{
  "name" : "node1",
  "cluster_name" : "my_cluster",
  "cluster_uuid" : "Yz9-okKBS--QW6pDa4NcrA",
  "version" : {
    "number" : "7.9.2",
    "build_flavor" : "default",
    "build_type" : "docker",
    "build_hash" : "d34da0ea4a966c4e49417f2da2f244e3e97b4e6e",
    "build_date" : "2020-09-23T00:45:33.626720Z",
    "build_snapshot" : false,
    "lucene_version" : "8.6.2",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}

</prev>

## 9. Acessar o Kibana através do browser:

http://localhost:5601/ (Links para um site externo.)

![kibana página inicial](/course_image/pagina_acesso_kibana1.png)

![kibana página inicial](/course_image/pagina_acesso_kibana2.png)
