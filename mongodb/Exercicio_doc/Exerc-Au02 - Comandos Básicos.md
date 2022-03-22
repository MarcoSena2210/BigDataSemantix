Au02 Exercícios - Comandos Básicos
Comando Básicos para BD, Collections e Documentos

### 1. Criar o banco de dados com seu nome.
> use marcosena
switched to db marcosena

2. Listar os banco de dados.
> db
marcosena
>


### 3. Criar a collection produto no bd com seu nome.
> use marcosena
switched to db marcosena

> db.create.collection('marcosena')
uncaught exception: TypeError: db.create.collection is not a function :
@(shell):1:1
>
## Resposta: 
> db.createCollection('produto')
{ "ok" : 1 }
>

### 4. Listar os banco de dados.
## Resposta
> show dbs
## Retorna:
admin      0.000GB
config     0.000GB
local      0.000GB
marcosena  0.000GB
>

### 5. Listar as collections.
## Resposta
> show collections
## Retorna:
produto
>
## 6. Inserir os seguintes documentos na collection produto:


>

## _id: 1, "nome": “cpu i5", "qtd": "15“

> db.produto.insertOne({_id:1,nome:"cpu 15","qtd":"15"})
{ "acknowledged" : true, "insertedId" : 1 }

## _id: 2, nome: “memória ram", qtd: 10, descricao: {armazenamento: “8GB”, tipo:“DDR4“}
## Resposta
> db.produto.insertOne({_id:2,nome:"memória ram",qtd:10,descricao: {armazenamento:"8 GB",tipo:"DOR4"} })
{ "acknowledged" : true, "insertedId" : 2 }
>


## _id: 3, nome: "mouse", qtd: 50, descricao: {conexao: “USB”, so: [“Windows”, “Mac”, “Linux“]}
## Resposta 
> db.produto.insertOne({ _id: 3, nome: "mouse", qtd: 50, descricao: {conexao: "USB", so: ["Windows", "Mac", "Linux"]} } )
{ "acknowledged" : true, "insertedId" : 3 }
>
## Listando os produtos cadastrados 
 db.produto.find()
{ "_id" : 1, "nome" : "cpu 15", "qtd" : "15" }
{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
{ "_id" : 3, "nome" : "mouse", "qtd" : 50, "descricao" : { "conexao" : "USB", "so" : [ "Windows", "Mac", "Linux" ] } }
>



## _id: 4, nome: “hd externo", "qtd": 20, descricao: {conexao: “USB”, armazenamento: “500GB”, so: [“Windows 10”, “Windows 8”, “Windows 7”]}
> db.produto.insertOne({ _id: 4, nome: "hd externo", "qtd": 20, descricao: {conexao: "USB", armazenamento: "500GB", so: ["Windows 10", "Windows 8", "Windows 7"]} }  )
{ "acknowledged" : true, "insertedId" : 4 }
>


### 7. Mostrar todos os documentos.
## Resposta
 Retorna:
 db.produto.find()
{ "_id" : 1, "nome" : "cpu 15", "qtd" : "15" }
{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
{ "_id" : 3, "nome" : "mouse", "qtd" : 50, "descricao" : { "conexao" : "USB", "so" : [ "Windows", "Mac", "Linux" ] } }
{ "_id" : ObjectId("6216a3e6f2b2b5932a214abd") }
{ "_id" : ObjectId("6216a3eaf2b2b5932a214abe") }
{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB", "armazenamento" : "500GB", "so" : [ "Windows 10", "Windows 8", "Windows 7" ] } }
>
