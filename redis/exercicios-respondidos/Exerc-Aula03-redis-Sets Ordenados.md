# Exerc-Aula03-redis-Sets Ordenados

* Acessanndo o ambiente:

marco@DESKTOP-G2455QH:~$<code> cd treinamentos </code>

marco@DESKTOP-G2455QH:~/treinamentos$<code> cd redis</code>

* Verificar se o serviço está ativo?

marco@DESKTOP-G2455QH:~/treinamentos/redis$<code> docker ps</code>

Retorna:

<prev> 
CONTAINER ID   IMAGE     COMMAND                  CREATED        STATUS          PORTS                                       NAMES
07ca87c952c0   redis     "redis-server --appe…"   46 hours ago   Up 14 minutes   0.0.0.0:6379->6379/tcp, :::6379->6379/tcp   redis
</prev>

* O serviço já está iniciado. 
(caso contrario precisa iniciar com o docker-compose up -d ou docker-compose start)

marco@DESKTOP-G2455QH:~/treinamentos/redis$<code> docker exec -it redis bash </code>

* Chamando o redis cliente:
root@07ca87c952c0:/data#<code>redis-cli </code>
127.0.0.1:6379>

## 1. Deletar a chave “pesquisa:produto”
127.0.0.1:6379><code>del pesquisa:produto
</code>

Retorna:
<prev>(integer) 1</prev>

* Dica 
* 0 = Chave não existia
* 1 = Conseguiu deletar


## 2. Criar a chave "pesquisa:produto" do tipo set ordenado com os seguintes valores:

Valor: monitor, Score: 100
Valor: HD, Score: 20
Valor: mouse, Score: 10
Valor: teclado, Score: 50


127.0.0.1:6379><code>zadd pesquisa:produto 100 monitor 20 HD 10 mouse 50 teclado
</code>

Retorna:
<prev>(integer) 4</prev>

* O score representa a quantidade de pesquisas feitas para aquele produto na aplicação


## 1. Visualizar a quantidade de produtos
127.0.0.1:6379><code>zcard pesquisa:produto</code>

Retorna:
<prev>(integer) 4</prev>

## 2. Visualizar todos os produtos do mais pesquisado ao menos pesquisado
127.0.0.1:6379><code>zrevrange pesquisa:produto 0 -1
</code>

Retorna:
<prev>
1) "monitor"
2) "teclado"
3) "HD"
4) "mouse"</prev>

* Dica:
* zrange -ordenada menor -> maior
* zrevrange -ordenada maior -> menor

## 3. Visualizar o rank do produto teclado
127.0.0.1:6379><code>zrevrank pesquisa:produto teclado
</code>

Retorna:
<prev>(integer) 1</prev>

*Dica:
* A resposta foi 1 porque começa do zero.Neste caso monitor é 0 e o teclado 1


## 4. Visualizar o score do produto teclado
127.0.0.1:6379><code> zscore pesquisa:produto teclado
</code>

Retorna:
<prev>"50"</prev>

## 5. Remover o valor HD da chave
127.0.0.1:6379><code>zrem pesquisa:produto HD</code>

Retorna:
<prev>(integer) 1</prev>

* Dica: 
* 1 = Conseguiu remover
* 0 = Não consegiui remover

## 6. Recuperar e remover do set o produto mais pesquisado
127.0.0.1:6379><code> zpopmax pesquisa:produto
</code>

Retorna:
<prev>1) "monitor"
2) "100"</prev>

## 7. Recuperar e remover do set o produto menos pesquisado
127.0.0.1:6379><code>zpopmin pesquisa:produto
</code>

Retorna:
<prev>
1) "mouse"
2) "10"</prev>


## 8. Visualizar todos os produtos
127.0.0.1:6379><code> zrange pesquisa:produto 0 -1
</code>

Retorna:
<prev>1) "teclado"</prev>


