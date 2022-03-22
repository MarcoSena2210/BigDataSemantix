### Exerc-Au03 -Redis - Hashes

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

## 1. Deletar a chave “usuario:100”

127.0.0.1:6379><code>del usuario:100
</code>

Retorna:
<prev>(integer) 0</prev>
Dica: 0 = Não foi encontrado essa chave

## 2. Criar uma chave “usuario:100” do tipo hash com a seguinte estrutura

nome – Augusto
estado – SP
views – 10

127.0.0.1:6379><code>hmset usuario:100 nome Augusto estado SP views 10
</code>

Retorna:
<prev>OK</prev>

### Dica:
 
* hset chave campo valor é usado para criar 1 set  hash por vez 

  h<b>m</b>set  é para criar vários chaves valor de uma única vez.

## 3. Visualizar todas as chaves e valores
127.0.0.1:6379><code> hgetall usuario:100
</code>

Retorna:
<prev>
1) "nome"
2) "Augusto"
3) "estado"
4) "SP"
5) "views"
6) "10"</prev>

## 4. Contar a quantidade de campos
127.0.0.1:6379><code>hlen usuario:100
</code>

Retorna:
<prev>(integer) 3</prev>

## 5. Visualizar apenas o nome e views
127.0.0.1:6379><code>hmget usuario:100 nome views
</code>

Retorna:
<prev>1) "Augusto"
2) "10"</prev>

## 6. Contar o tamanho do valor do campo nome
127.0.0.1:6379><code>hstrlen usuario:100 nome
</code>

Retorna:
<prev>(integer) 7</prev>

## 7. Incrementar em 2 o valor do campo views
127.0.0.1:6379><code> hincrby usuario:100 views 2
</code>

Retorna:
<prev>(integer) 12</prev>

## 8. Visualizar apenas os campos
127.0.0.1:6379><code> hkeys usuario:100
</code>

Retorna:
<prev>
1) "nome"
2) "estado"
3) "views"
</prev>

## 9. Visualizar apenas os valores
127.0.0.1:6379><code>hvals usuario:100
</code>

Retorna:
<prev>
1) "Augusto"
2) "SP"
3) "12"
</prev>

## 10. Deletar o campo estado
127.0.0.1:6379><code>hdel usuario:100 estado
</code>

Retorna:
<prev>(integer) 1</prev>

Dica: Para verificar
127.0.0.1:6379><code>hgetall usuario:100
</code>

Retorna:
<prev>1) "nome"
2) "Augusto"
3) "views"
4) "12"
</prev>
