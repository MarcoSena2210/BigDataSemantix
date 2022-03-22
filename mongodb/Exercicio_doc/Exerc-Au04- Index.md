Exercícios - Index
Vencimento Sem prazo de entrega Pontos Nenhum
Index e plano de execução

### 1. Mostrar todos os documentos da collection produto do banco de dados seu nome

db.produto.find()
{ "_id" : 1, "nome" : "cpu i7", "qtd" : 15 }

{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }

{ "_id" : 3, "nome" : "mouse", "qtd" : 30, "descricao" : { "conexao" : "USB 3.0", "sistema" : [ " Windows 10", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z"), "ts_modificado" : Timestamp(1645740469, 1) }

{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z") }


### 2. Criar o index “query_produto” para pesquisar o campo nome do produto em ordem alfabética
> db.produto.createIndex({nome:1})
{
        "numIndexesBefore" : 1,
        "numIndexesAfter" : 2,
        "createdCollectionAutomatically" : false,
        "ok" : 1
}
>Resposta: Correta 
> db.produto.createIndex({nome:1},{name: "query_produto"  })
{
        "ok" : 0,
        "errmsg" : "Index already exists with a different name: nome_1",
        "code" : 85,
        "codeName" : "IndexOptionsConflict"
}
## Apagando o index errado
> db.produto.dropIndex({nome:1})
{ "nIndexesWas" : 2, "ok" : 1 }
>> 

#### Resposta Correta 
> db.produto.createIndex({nome:1},{name: "query_produto"  })
{
        "numIndexesBefore" : 1,
        "numIndexesAfter" : 2,
        "createdCollectionAutomatically" : false,
        "ok" : 1
}

> 

## Listando o index correto
> db.produto.getIndexes()
[
        {
                "v" : 2,
                "key" : {
                        "_id" : 1
                },
                "name" : "_id_"
        },
        {
                "v" : 2,
                "key" : {
                        "nome" : 1
                },
                "name" : "query_produto"
        }
]
>





### 3. Pesquisar todos os índices da collection produto
## Listando o index correto (Percebemos que temos dois indexes, o criado por padrão pelomongo, não deve ser deletado e o que criamos  )
> db.produto.getIndexes()
[
        {
                "v" : 2,
                "key" : {
                        "_id" : 1
                },
                "name" : "_id_"
        },
        {
                "v" : 2,
                "key" : {
                        "nome" : 1
                },
                "name" : "query_produto"
        }
]
>

### 4. Pesquisar todos os documentos da collection produto
> db.produto.find()

{ "_id" : 1, "nome" : "cpu i7", "qtd" : 15 }

{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }

{ "_id" : 3, "nome" : "mouse", "qtd" : 30, "descricao" : { "conexao" : "USB 3.0", "sistema" : [ " Windows 10", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z"), "ts_modificado" : Timestamp(1645740469, 1) }

{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z") }
>
### 5. Visualizar o plano de execução do exercício 4
 db.produto.find().explain()
{
        "explainVersion" : "1",
        "queryPlanner" : {
                "namespace" : "marcosena.produto",
                "indexFilterSet" : false,
                "parsedQuery" : {

                },
                "queryHash" : "8B3D4AB8",
                "planCacheKey" : "D542626C",
                "maxIndexedOrSolutionsReached" : false,
                "maxIndexedAndSolutionsReached" : false,
                "maxScansToExplodeReached" : false,
                "winningPlan" : {
                        "stage" : "COLLSCAN",
                        "direction" : "forward"
                },
                "rejectedPlans" : [ ]
        },
        "command" : {
                "find" : "produto",
                "filter" : {

                },
                "$db" : "marcosena"
        },
        "serverInfo" : {
                "host" : "87637f2ffe4b",
                "port" : 27017,
                "version" : "5.0.6",
                "gitVersion" : "212a8dbb47f07427dae194a9c75baec1d81d9259"
        },
        "serverParameters" : {
                "internalQueryFacetBufferSizeBytes" : 104857600,
                "internalQueryFacetMaxOutputDocSizeBytes" : 104857600,
                "internalLookupStageIntermediateDocumentMaxSizeBytes" : 104857600,
                "internalDocumentSourceGroupMaxMemoryBytes" : 104857600,
                "internalQueryMaxBlockingSortMemoryUsageBytes" : 104857600,
                "internalQueryProhibitBlockingMergeOnMongoS" : 0,
                "internalQueryMaxAddToSetBytes" : 104857600,
                "internalDocumentSourceSetWindowFieldsMaxMemoryBytes" : 104857600
        },
        "ok" : 1
}
>


### 6. Pesquisar todos os documentos da collection produto, com uso da index “query_produto”
Resposta: 
Obeservamos que  não foi informado o index que criamos, porém está ordenado pelo nome e não por id.  
> db.produto.find().hint({nome:1})

{ "_id" : 1, "nome" : "cpu i7", "qtd" : 15 }

{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7", "Linux" ] }, "data_modificacao" : ISODate

("2022-02-24T20:34:10.507Z") }

{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }

{ "_id" : 3, "nome" : "mouse", "qtd" : 30, "descricao" : { "conexao" : "USB 3.0", "sistema" : [ " Windows 10", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z"), "ts_modificado" : Timestamp(1645740469, 1) }
>
Verificando o plano de execução:
> db.produto.explain().find().hint({nome:1})
{
        "explainVersion" : "1",
        "queryPlanner" : {
                "namespace" : "marcosena.produto",
                "indexFilterSet" : false,
                "parsedQuery" : {

                },
                "queryHash" : "8B3D4AB8",
                "planCacheKey" : "D542626C",
                "maxIndexedOrSolutionsReached" : false,
                "maxIndexedAndSolutionsReached" : false,
                "maxScansToExplodeReached" : false,
                "winningPlan" : {
                        "stage" : "FETCH",
                        "inputStage" : {
                                "stage" : "IXSCAN",
                                "keyPattern" : {
                                        "nome" : 1
                                },
                                "indexName" : "query_produto",
                                "isMultiKey" : false,
                                "multiKeyPaths" : {
                                        "nome" : [ ]
                                },
                                "isUnique" : false,
                                "isSparse" : false,
                                "isPartial" : false,
                                "indexVersion" : 2,
                                "direction" : "forward",
                                "indexBounds" : {
                                        "nome" : [
                                                "[MinKey, MaxKey]"
                                        ]
                                }
                        }
                },
                "rejectedPlans" : [ ]
        },
        "command" : {
                "find" : "produto",
                "filter" : {

                },
                "hint" : {
                        "nome" : 1
                },
                "$db" : "marcosena"
        },
        "serverInfo" : {
                "host" : "87637f2ffe4b",
                "port" : 27017,
                "version" : "5.0.6",
                "gitVersion" : "212a8dbb47f07427dae194a9c75baec1d81d9259"
        },
        "serverParameters" : {
                "internalQueryFacetBufferSizeBytes" : 104857600,
                "internalQueryFacetMaxOutputDocSizeBytes" : 104857600,
                "internalLookupStageIntermediateDocumentMaxSizeBytes" : 104857600,
                "internalDocumentSourceGroupMaxMemoryBytes" : 104857600,
                "internalQueryMaxBlockingSortMemoryUsageBytes" : 104857600,
                "internalQueryProhibitBlockingMergeOnMongoS" : 0,
                "internalQueryMaxAddToSetBytes" : 104857600,
                "internalDocumentSourceSetWindowFieldsMaxMemoryBytes" : 104857600
        },
        "ok" : 1
}
>

### É diferente de:
> db.produto.find()
{ "_id" : 1, "nome" : "cpu i7", "qtd" : 15 }

{ "_id" : 2, "nome" : "memória ram", "qtd" : 10, "descricao" : { "armazenamento" : "8 GB", "tipo" : "DOR4" } }

{ "_id" : 3, "nome" : "mouse", "qtd" : 30, "descricao" : { "conexao" : "USB 3.0", "sistema" : [ " Windows 10", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z"), "ts_modificado" : Timestamp(1645740469, 1) }

{ "_id" : 4, "nome" : "hd externo", "qtd" : 20, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 10", "Windows 8", "Windows 7", "Linux" ] }, "data_modificacao" : ISODate("2022-02-24T20:34:10.507Z") } 

## Verificando o plano de execução:
 db.produto.find().explain()
{
        "explainVersion" : "1",
        "queryPlanner" : {
                "namespace" : "marcosena.produto",
                "indexFilterSet" : false,
                "parsedQuery" : {

                },
                "queryHash" : "8B3D4AB8",
                "planCacheKey" : "D542626C",
                "maxIndexedOrSolutionsReached" : false,
                "maxIndexedAndSolutionsReached" : false,
                "maxScansToExplodeReached" : false,
                "winningPlan" : {
                        "stage" : "COLLSCAN",
                        "direction" : "forward"
                },
                "rejectedPlans" : [ ]
        },
        "command" : {
                "find" : "produto",
                "filter" : {

                },
                "$db" : "marcosena"
        },
        "serverInfo" : {
                "host" : "87637f2ffe4b",
                "port" : 27017,
                "version" : "5.0.6",
                "gitVersion" : "212a8dbb47f07427dae194a9c75baec1d81d9259"
        },
        "serverParameters" : {
                "internalQueryFacetBufferSizeBytes" : 104857600,
                "internalQueryFacetMaxOutputDocSizeBytes" : 104857600,
                "internalLookupStageIntermediateDocumentMaxSizeBytes" : 104857600,
                "internalDocumentSourceGroupMaxMemoryBytes" : 104857600,
                "internalQueryMaxBlockingSortMemoryUsageBytes" : 104857600,
                "internalQueryProhibitBlockingMergeOnMongoS" : 0,
                "internalQueryMaxAddToSetBytes" : 104857600,
                "internalDocumentSourceSetWindowFieldsMaxMemoryBytes" : 104857600
        },
        "ok" : 1
}


### 7. Visualizar o plano de execução do exercício 7 
> db.produto.explain().find().hint({nome:1})
{
        "explainVersion" : "1",
        "queryPlanner" : {
                "namespace" : "marcosena.produto",
                "indexFilterSet" : false,
                "parsedQuery" : {

                },
                "queryHash" : "8B3D4AB8",
                "planCacheKey" : "D542626C",
                "maxIndexedOrSolutionsReached" : false,
                "maxIndexedAndSolutionsReached" : false,
                "maxScansToExplodeReached" : false,
                "winningPlan" : {
                        "stage" : "FETCH",
                        "inputStage" : {
                                "stage" : "IXSCAN",
                                "keyPattern" : {
                                        "nome" : 1
                                },
                                "indexName" : "query_produto",
                                "isMultiKey" : false,
                                "multiKeyPaths" : {
                                        "nome" : [ ]
                                },
                                "isUnique" : false,
                                "isSparse" : false,
                                "isPartial" : false,
                                "indexVersion" : 2,
                                "direction" : "forward",
                                "indexBounds" : {
                                        "nome" : [
                                                "[MinKey, MaxKey]"
                                        ]
                                }
                        }
                },
                "rejectedPlans" : [ ]
        },
        "command" : {
                "find" : "produto",
                "filter" : {

                },
                "hint" : {
                        "nome" : 1
                },
                "$db" : "marcosena"
        },
        "serverInfo" : {
                "host" : "87637f2ffe4b",
                "port" : 27017,
                "version" : "5.0.6",
                "gitVersion" : "212a8dbb47f07427dae194a9c75baec1d81d9259"
        },
        "serverParameters" : {
                "internalQueryFacetBufferSizeBytes" : 104857600,
                "internalQueryFacetMaxOutputDocSizeBytes" : 104857600,
                "internalLookupStageIntermediateDocumentMaxSizeBytes" : 104857600,
                "internalDocumentSourceGroupMaxMemoryBytes" : 104857600,
                "internalQueryMaxBlockingSortMemoryUsageBytes" : 104857600,
                "internalQueryProhibitBlockingMergeOnMongoS" : 0,
                "internalQueryMaxAddToSetBytes" : 104857600,
                "internalDocumentSourceSetWindowFieldsMaxMemoryBytes" : 104857600
        },
        "ok" : 1
}
>

### 8. Remover o index “query_produto”
Resposta:
Dica: não pode ser pelo nome que demos .Smpre terá que ser pela chave.
> db.produto.dropIndex({nome:1})
{ "nIndexesWas" : 2, "ok" : 1 }
>
### 9. Pesquisar todos os índices da collection produto
### Resposta (Verificamos apenas o index padrão do mongo) 
> db.produto.getIndexes()
[ { "v" : 2, "key" : { "_id" : 1 }, "name" : "_id_" } ]
>
Fim