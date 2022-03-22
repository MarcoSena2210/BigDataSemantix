# Exerc-Aula02 - Redis Strings
* Com o docker no ar, vamos chamar o redis:

marco@DESKTOP-G2455QH:~/treinamentos/redis$
<code> docker exec -it redis bash</code>

Retorna:

<prev>root@07ca87c952c0:/data#</prev> 

* Para usar linha de comando redis, root@07ca87c952c0:/data# :
<code>redis-cli</code>

Retorna:
<prev>127.0.0.1:6379></prev>


## 1. Criar a chave "usuario:nome" e atribua o valor do seu nome
em 127.0.0.1:6379> digite:
<code>set usuario:nome Marco</code>

Retorna:
<prev>OK</prev>

* Para listar:
127.0.0.1:6379><code> get usuario:nome </code>

Retorna:

<prev>"Marco" </prev>

## 2. Criar a chave "usuario:sobrenome" e atribua o valor do seu sobrenome
### Acessanndo o ambiente:

marco@DESKTOP-G2455QH:~$
<code> cd treinamentos </code>

marco@DESKTOP-G2455QH:~/treinamentos$<code> cd redis</code>

* Verificar se o serviço está ativo?

marco@DESKTOP-G2455QH:~/treinamentos/redis$<code> docker ps</code>

Retorna:

<prev> 
CONTAINER ID   IMAGE     COMMAND                  CREATED        STATUS          PORTS                                       NAMES
07ca87c952c0   redis     "redis-server --appe…"   46 hours ago   Up 14 minutes   0.0.0.0:6379->6379/tcp, :::6379->6379/tcp   redis
</prev>

* O serviço já está iniciado. 
caso contrario precisamos iniciar com o docker-compose up -d ou docker-compose start)

marco@DESKTOP-G2455QH:~/treinamentos/redis$<code> docker exec -it redis bash </code>

* Chamando o redis cliente:
root@07ca87c952c0:/data#<code>redis-cli </code>
127.0.0.1:6379>


## 3. Busque a chave "usuario:nome“
127.0.0.1:6379><code>get usuario:nome</code>

Retorna:
<prev>"Marco"</prev>

## 4. Verificar o tamanho da chave "usuario:nome“
127.0.0.1:6379><code>strlen usuario:nome</code>

Retorna:
<prev>(integer) 5 </prev>

## 5. Verificar o tipo da chave "usuario:sobrenome"
<code>127.0.0.1:6379> type usuario:sobrenome</code>

Retorna:
<prev>string</prev>

## 6. Criar a chave "views:qtd" e atribua o valor 100

127.0.0.1:6379><code>set views:qtd 100</code>

Retorna:
<prev>OK</prev>

## 7. Incremente o valor em 10 da chave "views:qtd"
127.0.0.1:6379><code>incrby views:qtd 10</code>

Retorna:
<prev>(integer) 110</prev>

## 8. Busque a chave "views:qtd"
127.0.0.1:6379><code>get views:qtd</code>

Retorna:
<prev>"110"</prev>

## 9. Deletar a chave "usuario:sobrenome"

127.0.0.1:6379><code> del usuario:sobrenome</code>

Retorna: 
<prev>(integer) 1</prev>
### Dica 1 =  true, foi confirmado 

## 10. Verificar se a chave "usuario:sobrenome" existe
127.0.0.1:6379> 
<code>exists usuario:sobrenome</code>

Retorna:
<prev>(integer) 0</prev> 
### Dica 0 =  Não existe


## 11. Definir um tempo de 3600 segundos para a chave "views:qtd" ser removida
127.0.0.1:6379> <code>expire views:qtd 3600</code>

Retona:
<prev>(integer) 1</prev>  (deu certo)
Dica:3600segundos = a 1 dia 


## 12. Verificar quanto tempo falta para a chave "views:qtd" ser removida
127.0.0.1:6379><code>ttl views:qtd</code>

Retorna:
<prev>(integer) 3422</prev>
Dica: Conseguimos verificar quanto tempo falta para a chave ser removida. 

## 13. Verificar a persistência da chave "usuario:nome"
127.0.0.1:6379><code>ttl usuario:nome</co/de>

Retorna: 
<prev>(integer) -2</prev>

## 14. Definir para a chave "views:qtd" ter persistência para sempre

127.0.0.1:6379><code>persist views:qtd</code>

Retorna:
<prev>(integer) 1</prev>

