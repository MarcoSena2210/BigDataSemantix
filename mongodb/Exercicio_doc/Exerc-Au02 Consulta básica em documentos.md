Exercício Consulta básica em documentos

### 1. Mostrar todos os documentos da collection produto
## Resposta 
> db.produto.find()
## Restorna:
{ "_id" : 1, "nome" : "cpu 15", "qtd" : "15" }
{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
{ "_id" : 3, "nome" : "mouse", "qtd" : 50, "descricao" : { "conexao" : "USB", "so" : [ "Windows", "Mac", "Linux" ] } }
{ "_id" : ObjectId("6216a3e6f2b2b5932a214abd") }
{ "_id" : ObjectId("6216a3eaf2b2b5932a214abe") }
{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB", "armazenamento" : "500GB", "so" : [ "Windows 10", "Windows 8", "Windows 7" ] } }
>


### 2. Pesquisar na collection produto, os documentos com os seguintes atributos:
### a) Nome = mouse
> db.produto.find(
    {nome:"mouse"}) {
          "_id" : 3, "nome" : "mouse", "qtd" : 50,
           "descricao" : { "conexao" : "USB", "so" :
            [ "Windows", "Mac", "Linux" ] } }
>
### b) Quantidade = 20 e apresentar apenas o campo nome
Dica : O atributo 0 (zero) ou 1 (um), projeção representa false,true.Ex:{nome:1}   
## Resposta 
> db.produto.find({qtd:{$eq:20}},{nome:1})

{ "_id" : 4, "nome" : "hd externo" }
>
ou 
> db.produto.find( {qtd:20}, {nome:1 } )
{ "_id" : 4, "nome" : "hd externo" }

## Podemos ainda retirar o id
> db.produto.find( {qtd:20}, {_id:0,nome:1 } )
{ "nome" : "hd externo" }

### c) Quantidade <= 20 e apresentar apenas os campos nome e qtd

> db.produto.find({qtd:{$lte:20}},{nome:1,qtd:1})

{ "_id" : 2, "nome" : "memória ram", "qtd" : 10 }
{ "_id" : 4, "nome" : "hd externo", "qtd" : 20 }
>
??? Porque ele não pegou o id = 1

### d) Quantidade entre 10 e 20
> db.produto.find( { qtd:{$gte: 10,$lte:20} } )

{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }

{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB", "armazenamento" : "500GB", "so" : [ "Windows 10", "Windows 8", "Windows 7" ] } }
>

### e) Conexão = USB e não apresentar o campo _id e qtd
 db.produto.find( {   "descricao.conexao" : "USB" } , {_id:0,qtd:0 })
33 retorna: 
{ "nome" : "mouse", "descricao" : { "conexao" : "USB", "so" : [ "Windows", "Mac", "Linux" ] } }

{ "nome" : "hd externo", "descricao" : { "conexao" : "USB", "armazenamento" : "500GB", "so" : [ "Windows 10", "Windows 8", "Windows 7" ] } }
>
### f) SO que contenha “Windows” ou “Windows10"
Resposta:
> db.produto.find({'descricao.so':{$in:[ "Windows","Windows 10"] }} )
Retorna:

{ "_id" : 3, "nome" : "mouse", "qtd" : 50, "descricao" : { "conexao" : "USB", "so" : [ "Windows", "Mac", "Linux" ] } }

{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB", "armazenamento" : "500GB", "so" : [ "Windows 10", "Windows 8", "Windows 7" ] } }
>
