# Exerc-Aula04 -Redis- Pub/Sub

## Acessanndo o ambiente:

marco@DESKTOP-G2455QH:~$<code> cd treinamentos </code>

marco@DESKTOP-G2455QH:~/treinamentos$<code> cd redis</code>

## Verificar se o serviço está ativo?

marco@DESKTOP-G2455QH:~/treinamentos/redis$<code> docker ps</code>

Retorna:

<prev> 
CONTAINER ID   IMAGE     COMMAND                  CREATED        STATUS          PORTS                                       NAMES
07ca87c952c0   redis     "redis-server --appe…"   46 hours ago   Up 14 minutes   0.0.0.0:6379->6379/tcp, :::6379->6379/tcp   redis
</prev>

## O serviço já está iniciado. 
(caso contrario precisava iniciar com o docker-compose up -d ou docker-compose start)

marco@DESKTOP-G2455QH:~/treinamentos/redis$<code> docker exec -it redis bash </code>

Chamando o redis cliente:
root@07ca87c952c0:/data#<code>redis-cli </code>
127.0.0.1:6379>


## 1. Criar um assinante para receber as mensagens do canal noticias:sp
127.0.0.1:6379><code>subscribe noticias:sp
</code>

Retorna:
<prev>Reading messages... (press Ctrl-C to quit)
1) "subscribe"
2) "noticias:sp"
3) (integer) 1</prev>


## 2. Criar um editor para enviar as seguintes mensagens no canal noticias:sp

Msg 1
Msg 2
Msg 3
Dica: Em outro terminal, publicamos as mensagens para que possamos visualizar,simultaneamente.  
127.0.0.1:6379><code>publish noticias:sp Msg1</code>

Retorna:
<prev>(integer) 1</prev>

127.0.0.1:6379><code>publish noticias:sp Msg2</code>

Retorna:
<prev>(integer) 1</prev>

127.0.0.1:6379><code>publish noticias:sp Msg3</code>

Retorna:
<prev>(integer) 1</prev>

* Dica: 
No terminal anterior,será exibido.

<prev>
127.0.0.1:6379> subscribe noticias:sp
Reading messages... (press Ctrl-C to quit)
1) "subscribe"

2) "noticias:sp"
3) (integer) 1
1) "message"
2) "noticias:sp"
3) "Msg1"
1) "message"
2) "noticias:sp"
3) "Msg2"
1) "message"
2) "noticias:sp"
3) "Msg3"
1) "message"
2) "noticias:sp"
3) "Msg1"
1) "message"
2) "noticias:sp"
3) "Subindo o n\xc3\xadvel do apreendizado"
1) "message"
2) "noticias:sp"
3) "Brazilina"
</prev>

## 3. Cancelar o assinante do canal noticias:sp

No terminal assinante, digitar Ctrl + C
(essa é a resposta)  

## 4. Criar um assinante para receber as mensagens dos canais com o padrão noticias:*
127.0.0.1:6379><code>psubscribe noticias:*
</code>

Retorna:

<prev>
Reading messages... (press Ctrl-C to quit)

1) "psubscribe"
2) "noticias:*"
3) (integer) 1</prev>

## 5. Criar um editor para enviar as seguintes mensagens no canal noticias:rj

Msg 4
Msg 5
Msg 6

127.0.0.1:6379><code>publish noticias:sp "Msg4</code>

127.0.0.1:6379><code>publish noticias:rj "Msg5</code>

127.0.0.1:6379><code>publish noticias:rj "Msg6</code>

Dica: 
* Como criamos anteriormente o canal 
publish com o padrão noticias:*, o que significa que ele irá enviar para todos os canais qualquer mensagem que tenha esse padrão "noticias:" dessa forma podemos observar que as msg 4,5 e 6 foram recebidas pelo assiante crado anterimente.



Retorna:
<prev>"
127.0.0.1:6379> psubscribe noticias:*
Reading messages... (press Ctrl-C to quit)
1) "psubscribe"
2) "noticias:*"
3) (integer) 1

1) "pmessage"
2) "noticias:*"
3) "noticias:sp"
4) "Msg4"
1) "pmessage"
2) "noticias:*"
3) "noticias:rj"
4) "Msg5"
1) "pmessage"
2) "noticias:*"
3) "noticias:rj"
4) "Msg6"
novo"</prev>

