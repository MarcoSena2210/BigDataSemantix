# Exerc-Au03-Redis-Sets

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
(caso contrario precisava iniciar com o docker-compose up -d ou docker-compose start)

marco@DESKTOP-G2455QH:~/treinamentos/redis$<code> docker exec -it redis bash </code>

* Chamando o redis cliente:
root@07ca87c952c0:/data#<code>redis-cli </code>
127.0.0.1:6379>

## 1. Deletar a chave “pesquisa:produto”
127.0.0.1:6379><code>del pesquisa:produto
</code>

Retorna:
<prev>(integer) 0</prev>

* Dica 
* 0 = Chave não existia
* 1 = Conseguiu deletar

## 2. Criar a chave "pesquisa:produto" do tipo set com os seguintes valores: monitor, mouse e teclado
127.0.0.1:6379><code> sadd pesquisa:produto monitor mouse teclado
</code>

Retorna:
<prev>(integer) 3</prev>


## 3. Visualizar a quantidade de valores da chave
127.0.0.1:6379><code> scard pesquisa:produto
</code>

Retorna:
<prev>(integer) 3</prev>

## 4. Retornar todos os elementos da chave
127.0.0.1:6379><code> smembers pesquisa:produto
</code>

Retorna:
<prev>
1) "teclado"
2) "mouse"
3) "monitor"</prev>

## 5. Verificar se existe o valor monitor
127.0.0.1:6379><code>sismember pesquisa:produto monitor
</code>

Retorna:
<prev>(integer) 1</prev>

* Dica:
* 1 = Existe
* 0 = Não existe  
* É case sensitive.

## 6. Remover o valor monitor
127.0.0.1:6379><code>srem pesquisa:produto monitor
</code>

Retorna:
<prev>(integer) 1</prev> 

* Dica: 
* 1= True consegiu remover 

* Pesquisando novamente:
127.0.0.1:6379><code> sismember pesquisa:produto monitor </code>

Retorna: 
<prev> (integer) 0 </prev> 

* Aparece 0; não encontrou.

## 7. Recuperar um elemento e remove-lo do set
127.0.0.1:6379><code>spop pesquisa:produto
</code>

Retorna:
<prev>"mouse"</prev>

* Dica: 
* Esse comando pode remover qualquer item da chave.Precismos ter cuidado.

## 8. Criar a chave "pesquisa:desconto“ do tipo set com os seguintes valores: memória RAM, monitor, teclado, HD
127.0.0.1:6379><code>sadd pesquisa:desconto 'momoria RAM'  monitor teclado HD
</code>

Retorna:
<prev>(integer) 4</prev>

## 9. Próximas questões fazem uso dos sets pesquisa:produto e pesquisa:desconto

a) Visualizar a interseção entre os 2 sets
127.0.0.1:6379><code>sinter pesquisa:produto pesquisa:desconto</code>

Retorna:
<prev>
1) "teclado"</prev>

* Dica: 
* Existe teclado nas duas lista, pois foi excluído o "mouse"

* a) Visualizar a diferença entre os 2 sets
127.0.0.1:6379><code>sdiff pesquisa:produto pesquisa:desconto</code>

Retorna:
<prev>(empty array)</prev>

* Dica:
* Não encontrou diferença.A comparação é sempre rem relação a chave1


b)Criar o set "pesquisa:produto_desconto" com a união entre os 2 sets

127.0.0.1:6379><code> sunionstore pesquisa:produto_desconto pesquisa:produto pesquisa:desconto
</code>

Retorna:
<prev>(integer) 4</prev>

* Dica:
* Se fosse apenas para fazer a união sem criar o set, poderia ser respondido assim.

127.0.0.1:6379><code> sunion pesquisa:produto pesquisa:desconto
</code>

Retorna:
<prev>
1) "teclado"
2) "monitor"
3) "momoria RAM"
4) "HD"</prev>




