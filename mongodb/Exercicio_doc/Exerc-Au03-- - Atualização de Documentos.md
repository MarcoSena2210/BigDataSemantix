Exercícios - Atualização de Documentos
Vencimento Sem prazo de entrega Pontos Nenhum
Atualização de Documentos

### 1. Mostrar todos os documentos da collection produto do banco de dados seu nome
> show collections
produto
test

Resposta: 
> db.produto.find()
{ "_id" : 1, "nome" : "cpu 15", "qtd" : "15" }
{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
{ "_id" : 3, "nome" : "mouse", "qtd" : 50, "descricao" : { "conexao" : "USB", "so" : [ "Windows", "Mac", "Linux" ] } }
{ "_id" : ObjectId("6216a3e6f2b2b5932a214abd") }
{ "_id" : ObjectId("6216a3eaf2b2b5932a214abe") }
{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB", "armazenamento" : "500GB", "so" : [ "Windows 10", "Windows 8", "Windows 7" ] } }
>
### 2. Atualizar o valor do campo nome para “cpu i7” do id 1
> db.produto.updateOne({_id:1},{ $set: {nome:"cpu i7"} }  )
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }

Vamos verificar:
> db.produto.find({_id:1})
{ "_id" : 1, "nome" : "cpu i7", "qtd" : "15" }
> 
### 3. Atualizar o atributo quantidade para o tipo inteiro do id: 1
Dica vamos pesquisar o id 1, e observamos que está como string
> db.produto.find({_id:1})
{ "_id" : 1, "nome" : "cpu i7", "qtd" : "15" } 
>
Resposta:
> db.produto.updateOne( {_id:1}, {$set:{qtd:15 } } )

{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }

Para visualizar:
> db.produto.find({_id:1})
{ "_id" : 1, "nome" : "cpu i7", "qtd" : 15 }
>
### 4. Atualizar o valor do campo qtd para 30 de todos os documentos, com o campo qtd >= 30
Resposta
> db.produto.updateMany({qtd: { $gte:30 } }, {$set:{qtd:30  }}  )

{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }


Observamos que o item 3 que a quantidade é 50 passoo para 3 
> db.produto.find()
{ "_id" : 1, "nome" : "cpu i7", "qtd" : 15 }
{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
{ "_id" : 3, "nome" : "mouse", "qtd" : 30, "descricao" : { "conexao" : "USB", "so" : [ "Windows", "Mac", "Linux" ] } }
{ "_id" : ObjectId("6216a3e6f2b2b5932a214abd") }
{ "_id" : ObjectId("6216a3eaf2b2b5932a214abe") }
{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB", "armazenamento" : "500GB", "so" : [ "Windows 10", "Windows 8", "Windows 7" ] } }
>



### 5. Atualizar o nome do campo “descricao.so” para “descricao.sistema” de todos os documentos
Dica aqui será modificado o nome do campo de todos documentos que satisfaça a condição.Por isso iremos usar o rename ou invés do set (usado para valores)

> db.produto.updateMany({ }, {$rename:{"descricao.so":"descricao.sistema"}} )

{ "acknowledged" : true, "matchedCount" : 6, "modifiedCount" : 2 }
> db.produto.find()
{ "_id" : 1, "nome" : "cpu i7", "qtd" : 15 }
{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
{ "_id" : 3, "nome" : "mouse", "qtd" : 30, "descricao" : { "conexao" : "USB", "sistema" : [ "Windows", "Mac", "Linux" ] } }
{ "_id" : ObjectId("6216a3e6f2b2b5932a214abd") }
{ "_id" : ObjectId("6216a3eaf2b2b5932a214abe") }
{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7" ] } }
>


### 6. Atualizar o valor do campo descricao.conexao para “USB 2.0” de todos os documentos, com o campo descricao.conexão = “USB”
Resposta
> db.produto.updateMany({"descricao.conexao":"USB" }, {$set:{"descricao.conexao":"USB 2.0"}} )
Retorna:
{ "acknowledged" : true, "matchedCount" : 2, "modifiedCount" : 2 }
>


### 7. Atualizar o valor do campo descricao.conexao para “USB 3.0” de todos os documentos, com o campo descricao.conexao = “USB 2.0” e adicionar o campo “data_modificacao”, com a data da atualização dos documentos
db.produto.updateMany({"descricao.conexao":"USB 2.0" }, {$set:{"descricao.conexao":"USB 3.0"}, $currentDate: { data_modificacao: {$type: "date"}  }   })
{ "acknowledged" : true, "matchedCount" : 2, "modifiedCount" : 2 }
>
Listando: 
> db.produto.find()
{ "_id" : 1, "nome" : "cpu i7", "qtd" : 15 }
{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
{ "_id" : 3, "nome" : "mouse", "qtd" : 30, "descricao" : { "conexao" : "USB 3.0", "sistema" : [ "Windows", "Mac", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z") }
{ "_id" : ObjectId("6216a3e6f2b2b5932a214abd") }
{ "_id" : ObjectId("6216a3eaf2b2b5932a214abe") }
{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z") }
>
### 8. Atualizar um dos elementos do array descricao.sistema de “Windows” para “Windows 10” do id 3
Dica: estamos falando com uma array, está entre colchetes.no filtro precisamos indicar qualo elemento do array iremos buscar.
Atenção: Para indicar que queremos o elemento do array, precisamos usar .$ 
{$set:{"descricao.sistema.$": " Windows 10"}

Resposta: 
> db.produto.updateOne({_id:3, "descricao.sistema":"Windows"}  , {$set:{"descricao.sistema.$": " Windows 10"}  } )
Retorna

{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }

Listando:
> db.produto.find({_id:3})
{ "_id" : 3, "nome" : "mouse", "qtd" : 30, "descricao" : { "conexao" : "USB 3.0", "sistema" : [ " Windows 10", "Mac", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z") }
>


### 9. Acrescentar o valor “Linux” no array descricao.sistema do id 4
Resposta:
> db.produto.updateOne({_id:4 } , {$push:{"descricao.sistema": "Linux"} })

Retorna:
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
> 

Listando:
> db.produto.find({_id:4})

{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z") }
>

### 10. Remover o valor “Mac” no array descricao.sistema do id 3 e adicionar o campo “ts_modificacao”, com o timestamp da atualização dos documentos
Resposta:
> db.produto.updateOne( {_id:3}, {$pull: {"descricao.sistema": "Mac"}, $currentDate: { ts_modificado: {$type: "timestamp" } } } )
Retorno:
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
> db.produto.find({_id:3})

{ "_id" : 3, "nome" : "mouse", "qtd" : 30, "descricao" : { "conexao" : "USB 3.0", "sistema" : [ " Windows 10", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z"), "ts_modificado" : Timestamp(1645740469, 1) }
>
 