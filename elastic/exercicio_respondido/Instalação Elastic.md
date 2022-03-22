Instalação Elastic

1. Baixar a pasta elastic na Guia Arquivos do treinamento

2. Instalação do docker e docker-compose

Docker: https://docs.docker.com/get-docker/ (Links para um site externo.)
Docker-compose: https://docs.docker.com/compose/install/ (Links para um site externo.)
3. Executar os seguintes comandos, para baixar as imagens de Elastic:

docker pull docker.elastic.co/elasticsearch/elasticsearch:7.9.2
docker pull docker.elastic.co/kibana/kibana:7.9.2
docker pull docker.elastic.co/logstash/logstash:7.9.2
4. Setar na máquina o vm.max_map_count com no mínimo 262144

https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_set_vm_max_map_count_to_at_least_262144 (Links para um site externo.)
5. Iniciar o cluster Elastic através do docker-compose

6. Listas as imagens em execução

7. Verificar os logs dos containers em execução

8. Verificar as informações do cluster através do browser:

http://localhost:9200/ (Links para um site externo.)
9. Acessar o Kibana através do browser:

http://localhost:5601/ (Links para um site externo.)
10. Clicar no botão de Enviar Tarefa, e enviar o texto: ok