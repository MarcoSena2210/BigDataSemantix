# Exerc-Aula02 -Redis - Listas

## 1. Criar a chave “views:ultimo_usuario" e insira nesta ordem os seguintes valores como lista:

Final da lista “Joao”
Final da lista “Ana”
Inicio da lista “Carlos”
Final da lista “Carol”
* Inserindo João e Ana
127.0.0.1:6379> <code> rpush views:ultimo_usuario Joao Ana </code>

Retorna:
<prev>(integer) 2</prev>

* inserindo Carlos
127.0.0.1:6379><code>lpush views:ultimo_usuario Carlos </code>

Retorna:
<prev>(integer) 3</prev>

*Inserindo Carol
127.0.0.1:6379><code> rpush views:ultimo_usuario Carol </code>

Retorna:
<prev>(integer) 4 </prev>


## 2. Visualizar todos os elementos da lista

127.0.0.1:6379><code> lrange views:ultimo_usuario 0 -1 </code>

Retorna:
<prev>
1) "Carlos"
2) "Joao"
3) "Ana"
4) "Carol"
</prev>

### Dica: 

* 0 representa o primeiro elemento da lista

* -1 representa o ultimo elemento da lista

## 3. Visualizar todos os elementos da lista, com exceção do último
127.0.0.1:6379><code> lrange views:ultimo_usuario 0 -2</code>

Retorna:
<prev>
1) "Carlos"
2) "Joao"
3) "Ana"
</prev>


## 4. Visualizar o tamanho da lista
127.0.0.1:6379> <code>llen  views:ultimo_usuario</code>

Retorna:
<prev>
 (integer) 4
</prev>


## 5. Redefinir o tamanho da lista, removendo o primeiro elemento (Sem usar o pop)
127.0.0.1:6379> <code>ltrim views:ultimo_usuario 1 -1
</code>
Retorna:
<prev>OK</prev>


## 6. Visualizar o tamanho da lista

127.0.0.1:6379><code>llen views:ultimo_usuario
</code>

Retorna:
<prev>(integer) 3</prev>


## 7. Recuperar os elementos da lista da seguinte ordem:

### Primeiro
127.0.0.1:6379><code> lpop views:ultimo_usuario </code>
Resposta
<prev>"Joao" </prev>

### Último


"Joao"
127.0.0.1:6379><code>rpop views:ultimo_usuario
"Carol"</code>

## 8. Primeiro com bloqueio de 5 segundos se a lista estiver vazia

127.0.0.1:6379><code>blpop views:ultimo_usuario 5 </code>
Resposta:
<prev>
1) "views:ultimo_usuario"
2) "Ana"
</prev>

Para veificar se existe:
127.0.0.1:6379><code> exists  views:ultimo_usuario </code>

Retorna
<prev>(integer) 0 <prev> 
Dica 0=Não existe 

 