# Redis

### Redis é um armazenamento de estrutura de dados na memória de código aberto (licenciado BSD), usado como banco de dados, cache e agente de mensagens. O Redis fornece estruturas de dados como strings, hashes, listas, conjuntos, conjuntos classificados com consultas de intervalo, bitmaps, hiperloglogs, índices geoespaciais e fluxos. O Redis tem replicação integrada, script Lua, remoção de LRU, transações e diferentes níveis de persistência em disco, além de fornecer alta disponibilidade por meio do Redis Sentinel e particionamento automático com o Redis Cluster
[redis.io](https://redis.io/)


# Partindo da premissa que o docker e o docker compose já estão instalados, vamos nos atentar a fazer a instação do redis.

* 1 Baixar o redis na pasta treinamentos:
 docker pull redis

* 2 Copiar a imagem do serviço redis para pasta: treinamentos/redis   

 Obs: A imagem do serviço foi disponibilizada pelo treinamento da Semantix e baixada no ambiente windows

 Dica: Para copiar, na barra iniciar do windows digite \\wsl$ (irá abrir o ambiente linux.)
* 3 Copie o arquivo: docker-compose.Yaml do windows para a pasta no \Ubuntu-20.04\home\seu_ usuario_no_linux>\treinamentos\redis 
            

