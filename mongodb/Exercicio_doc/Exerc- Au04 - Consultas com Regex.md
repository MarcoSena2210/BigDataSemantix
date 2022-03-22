Exerc-Au04 - Consultas com Regex

### 1.Mostrar todos os documentos da collection produto do banco de dados seu nome
> db.produto.find()

{ "_id" : 1, "nome" : "cpu i7", "qtd" : 15 }

{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }

{ "_id" : 3, "nome" : "mouse", "qtd" : 30, "descricao" : { "conexao" : "USB 3.0", "sistema" : [ " Windows 10", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z"), "ts_modificado" : Timestamp(1645740469, 1) }

{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7", "Linux" ] }, "data_modificacao" : ISODate

("2022-02-24T20:34:10.507Z") }
>
### 2.Buscar os documentos com o atributo nome, que contenham a palavra “ cpu
Dica: Se procurarmos a palavra cpu sem o regex, ela pode existir porém não serencontrada.

> db.produto.find({'nome':"cpu"})
>   	                (não foi encontrada)

## Resposta :   
## Dica: O regexpode ser aplicado devárias formas:
> db.produto.find({'nome': {$regex: "cpu"}})
{ "_id" : 1, "nome" : "cpu i7", "qtd" : 15 }
            OU 
> db.produto.find({'nome': {$regex: /cpu/}})

{ "_id" : 1, "nome" : "cpu i7", "qtd" : 15 }

### 3.Buscar os documentos com o atributo nome, que começam por “ hd ” e apresentar os campos nome e qtd
Buscando inicialmente apenas os que começam com hd
> db.produto.find({'nome': {$regex: /^hd/}})
{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7", "Linux" ] }, "data_modificacao" : ISODate
("2022-02-24T20:34:10.507Z") }

## Resposta 
> db.produto.find({'nome': {$regex: /^hd/}}, {nome:1,qtd:1} )

{ "_id" : 4, "nome" : "hd externo", "qtd" : 20 }
>
Dica: Se desejar removee a exibição do id, acrescente _id = 0

> db.produto.find({'nome': {$regex: /^hd/}}, {nome:1,qtd:1, _id:0} )
{ "nome" : "hd externo", "qtd" : 20 }
> 

### 4.Buscar os documentos com o atributo descricao.armazenamento , que terminam com “GB” ou gb ” e  apresentar os campos nome e descricao
## Respota:

Fazendo por parte, exibindo todos os campos:

> db.produto.find({'descricao.armazenamento': {$regex: /GB/i}} )
{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z") }

> db.produto.find({'descricao.armazenamento': {$regex: /gb/i}} )
{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z") }
>

## Resposta:
> db.produto.find({'descricao.armazenamento': {$regex: /gb/i}}, {nome:1, descricao:1} )
{ "_id" : 2, "nome" : "memória ram", "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
{ "_id" : 4, "nome" : "hd externo", "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7", "Linux" ] } }
> 






### 5.Buscar os documentos com o atributo nome, que contenha a palavra memória, ignorando a letra “o”
## Resposta 
> db.produto.find({'nome': {$regex: /mem.ria/}})

{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
>
### 6.Buscar os documentos com o atributo qtd que contenham valores com letras, ao invés de números.

Listando 
> db.produto.find({'nome': {$regex: /[a-z]/}})
{ "_id" : 1, "nome" : "cpu i7", "qtd" : 15 }
{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }
{ "_id" : 3, "nome" : "mouse", "qtd" : 30, "descricao" : { "conexao" : "USB 3.0", "sistema" : [ " Windows 10", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z"), "ts_modificado" : Timestamp(1645740469, 1) }
{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z") }
>
## Resposta:
> db.produto.find({'qtd': {$regex: /[a-z]/}})
>               (Corretamente, não encontrou nenhuma quantidade com valores string.  )


### 7.Buscar os documentos com o atributo descricao.sistema , que tenha exatamente a palavra , que tenha exatamente a palavra “Windows"

Resposta: 
> db.produto.find({'descricao.sistema': {$regex: /^Windows$/}})
>       (Não encontrou nenhuma)
Dica: Se é a palavra exatamente igual, nem precisaria usa regex para encontrar ou não.
Não temos windows mas temos Windows 8
38
> db.produto.find({'descricao.sistema': 'Windows'})
>       (Não encontrou nenuma)

Outro exemplo com a palvra Windos 8  que existe:
> db.produto.find({'descricao.sistema': 'Windows 8'})

{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z") }
>

Agora com regex
> db.produto.find({'descricao.sistema': {$regex: /^Windows 8$/}})

{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z") }
>






