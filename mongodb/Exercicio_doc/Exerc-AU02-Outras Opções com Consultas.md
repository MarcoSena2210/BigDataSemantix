Exerc-AU02-Outras Opções com Consultas

Dica: Para exibir a resultado fr forma identada em json é só acrescentar nofinal da consulta o commpando
.pretty() 

### 1.Mostrar todos os documentos da collection produto
db.produto.find()
{ "_id" : 1, "nome" : "cpu 15", "qtd" : "15" }
{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
{ "_id" : 3, "nome" : "mouse", "qtd" : 50, "descricao" : { "conexao" : "USB", "so" : [ "Windows", "Mac", "Linux" ] } }
{ "_id" : ObjectId("6216a3e6f2b2b5932a214abd") }
{ "_id" : ObjectId("6216a3eaf2b2b5932a214abe") }
{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB", "armazenamento" : "500GB", "so" : [ "Windows 10", "Windows 8", "Windows 7" ] } }
>
### 2.Realizar as seguintes pesquisas na collection produto:
### a)Mostrar os documentos ordenados pelo nome em ordem alfabética
> db.produto.find().sort({nome: 1 })
{ "_id" : ObjectId("6216a3e6f2b2b5932a214abd") }
{ "_id" : ObjectId("6216a3eaf2b2b5932a214abe") }

{ "_id" : 1, "nome" : "cpu 15", "qtd" : "15" }


{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB", "armazenamento" : "500GB", "so" : [ "Windows 10", "Windows 8", "Windows 7" ] } }

{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }

{ "_id" : 3, "nome" : "mouse", "qtd" : 50, "descricao" : { "conexao" : "USB", "so" : [ "Windows", "Mac", "Linux" ] } }
>

### b)Mostrar os 3 primeiros documentos ordenados por nome e quantidade
Dica: No sort o atributo 1=Ordem Crescete e 0 -1= decrescente     

db.produto.find().sort({nome:1,qtd:1}).limit(3)

{ "_id" : ObjectId("6216a3eaf2b2b5932a214abe") }
{ "_id" : ObjectId("6216a3e6f2b2b5932a214abd") }
{ "_id" : 1, "nome" : "cpu 15", "qtd" : "15" }
>

## Em oderm decrescente de nome
> db.produto.find().sort({nome:-1,qtd:1}).limit(3)

{ "_id" : 3, "nome" : "mouse", "qtd" : 50, "descricao" : { "conexao" : "USB", "so" : [ "Windows", "Mac", "Linux" ] } }
{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB", "armazenamento" : "500GB", "so" : [ "Windows 10", "Windows 8", "Windows 7" ] } }
>


### c)Mostrar apenas 1 documento que tenha o atributo Conexão = USB
> db.produto.find({'descricao.conexao':"USB"}).limit(1)
{ "_id" : 3, "nome" : "mouse", "qtd" : 50, "descricao" : { "conexao" : "USB", "so" : [ "Windows", "Mac", "Linux" ] } }
>  OU 

> db.produto.findOne({'descricao.conexao':'USB' })
{
        "_id" : 3,
        "nome" : "mouse",
        "qtd" : 50,
        "descricao" : {
                "conexao" : "USB",
                "so" : [
                        "Windows",
                        "Mac",
                        "Linux"
                ]
        }
}

### d)Mostrar os documentos de tenham o atributo conexão = USB e quantidade menor que 25
> db.produto.find({'descricao.conexao':"USB",qtd:{$lte:25} } )

{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB", "armazenamento" : "500GB", "so" : [ "Windows 10", "Windows 8", "Windows 7" ] } }
>


### e)Mostrar os documentos de tenham o atributo conexão = USB ou quantidade menor que 25
> db.produto.find(  {'descricao.conexao':"USB",$or: [{ qtd:{$lte:25} }]  })

{"db.produto.find({$or: [   {'descricao.conexao':"USB"} ,{ qtd:{$lt:25}} ] })

{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }

{ "_id" : 3, "nome" : "mouse", "qtd" : 50, "descricao" : { "conexao" : "USB", "so" : [ "Windows", "Mac", "Linux" ] } }

{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB", "armazenamento" : "500GB", "so" : [ "Windows 10", "Windows 8", "Windows 7" ] } }
>

### f)Mostrar apenas os id dos documentos de tenham o atributo conexão = USB ou quantidade menor
que 25
 db.produto.find({$or: [   {'descricao.conexao':"USB"} ,{ qtd:{$lt:25}} ] },{_id:1} )
{ "_id" : 2 }
{ "_id" : 3 }
{ "_id" : 4 }


Dica trabalhando com datas:
> db.test.insertOne({ ts:new Timestamp(), 
                    date: new Date(),   
                    data_string:Date(), 
                    config_date:new Date("2020-08") 
                    });
Retorna: 
{
        "acknowledged" : true,
        "insertedId" : ObjectId("62174c956219f8e7fa5fd44b")
}
>
Listando a tabela:
 db.test.find().pretty()
{
        "_id" : ObjectId("62174c956219f8e7fa5fd44b"),
        "ts" : Timestamp(1645694101, 1),
        "date" : ISODate("2022-02-24T09:15:01.752Z"),
        "data_string" : "Thu Feb 24 2022 09:15:01 GMT+0000 (UTC)",
        "config_date" : ISODate("2020-08-01T00:00:00Z")
}
>