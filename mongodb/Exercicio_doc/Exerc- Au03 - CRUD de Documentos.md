Exercícios - CRUD de Documentos
Vencimento Sem prazo de entrega Pontos Nenhum
CRUD de Documentos

https://docs.mongodb.com/manual/introduction/

### 1. Criar a collection teste no banco de dados seu nome
db.createCollection("teste")

## Para verificar:
> show collections
produto
test
teste
>


### 2. Inserir o seguinte documento:

Campo: usuario, valor: Semantix
Campo: data_acesso, valor: data atual no formato ISODate

Resposta:
> db.teste.insertOne({usuario: 'Semantix', data_acesso: new Date() })
{
        "acknowledged" : true,
        "insertedId" : ObjectId("62180fd16219f8e7fa5fd44c")
}
Listando
> db.teste.find()
{ "_id" : ObjectId("62180fd16219f8e7fa5fd44c"), "usuario" : "Semantix", "data_acesso" : ISODate("2022-02-24T23:08:01.427Z") }
>
### 3. Buscar todos os documentos do ano >= 2020
Resposta:
> db.teste.find({data_acesso: {$gte: new Date("2020") }}  )
Retorna:
{ "_id" : ObjectId("62180fd16219f8e7fa5fd44c"), "usuario" : "Semantix", "data_acesso" : ISODate("2022-02-24T23:08:01.427Z") }
>
### 4. Atualizar o campo “data_acesso” para timestamp com o valor da atualização do usuario Semantix
Resposta
 db.teste.updateOne({usuario: "Semantix"},{$currentDate:{data_acesso: {$type:"timestamp"  } }   } )
Retorna:
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
>
Verificando:
 db.teste.find()
{ "_id" : ObjectId("62180fd16219f8e7fa5fd44c"), "usuario" : "Semantix", "data_acesso" : Timestamp(1645746347, 1) }
> db.teste.find()
{ "_id" : ObjectId("62180fd16219f8e7fa5fd44c"), "usuario" : "Semantix", "data_acesso" : Timestamp(1645746347, 1) }
>
db.teste.find()
{ "_id" : ObjectId("62180fd16219f8e7fa5fd44c"), "usuario" : "Semantix", "data_acesso" : Timestamp(1645746347, 1) }
>

### 5. Buscar todos os documentos
db.teste.find()
{ "_id" : ObjectId("62180fd16219f8e7fa5fd44c"), "usuario" : "Semantix", "data_acesso" : Timestamp(1645746347, 1) }

### 6. Deletar o documento criado pelo id
> db.teste.deleteOne({"_id" : ObjectId("62180fd16219f8e7fa5fd44c")})
{ "acknowledged" : true, "deletedCount" : 1 }
>

### 7. Deletar a collection
Verificando antes as coleções:

> show collections
produto
test
teste
Resposta: 
> db.teste.drop()
true

Verificando depois.
> show collections
produto
test
>

