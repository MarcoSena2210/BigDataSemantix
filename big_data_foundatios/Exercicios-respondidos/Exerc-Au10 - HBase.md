Exercícios - HBase

HBase - Exercícios

É atualmente muito utilizado para fazer put e get.1  

Comando básicos:
## Acessando o hbase:

1) marco@DESKTOP-G2455QH:~/treinamentos/docker-bigdata$ docker exec -it hbase-master bash


2) root@hbase-master:/# hbase shell
## Retorno:
2022-02-18 08:49:17,133 WARN  [main] util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
HBase Shell; enter 'help<RETURN>' for list of supported commands.
Type "exit<RETURN>" to leave the HBase Shell
Version 1.2.6, rUnknown, Mon May 29 02:25:32 CDT 2017

hbase(main):001:0>

## Status para saber se está ativo

hbase(main):002:0> status
Retorna:
1 active master, 0 backup masters, 1 servers, 1 dead, 2.0000 average load

## Ajuda de tabela 
hbase(main):003:0> table_help
Help for table-reference commands.

You can either create a table via 'create' and then manipulate the table via commands like 'put', 'get', etc.
See the standard help information for how to use each of these commands.

However, as of 0.96, you can also get a reference to a table, on which you can invoke commands.
For instance, you can get create a table and keep around a reference to it via:

   hbase> t = create 't', 'cf'

Or, if you have already created the table, you can get a reference to it:

   hbase> t = get_table 't'

You can do things like call 'put' on the table:

  hbase> t.put 'r', 'cf:q', 'v'

which puts a row 'r' with column family 'cf', qualifier 'q' and value 'v' into table t.

To read the data out, you can scan the table:

  hbase> t.scan

which will read all the rows in table 't'.

Essentially, any command that takes a table name can also be done via table reference.
Other commands include things like: get, delete, deleteall,
get_all_columns, get_counter, count, incr. These functions, along with
the standard JRuby object methods are also available via tab completion.

For more information on how to use each of these commands, you can also just type:

   hbase> t.help 'scan'

which will output more information on how to use that command.

You can also do general admin actions directly on a table; things like enable, disable,
flush and drop just by typing:

   hbase> t.enable
   hbase> t.flush
   hbase> t.disable
   hbase> t.drop

Note that after dropping a table, your reference to it becomes useless and further usage
is undefined (and not recommended).

hbase(main):004:0>

## Vendo a versão
root@hbase-master:/# hbase versiom
Error: Could not find or load main class versiom
root@hbase-master:/# hbase version
HBase 1.2.6
Source code repository file:///home/busbey/projects/hbase/hbase-assembly/target/hbase-1.2.6 revision=Unknown
Compiled by busbey on Mon May 29 02:25:32 CDT 2017
From source with checksum 7e8ce83a648e252758e9dae1fbe779c9

## whoami -Para vê informações dos usuários
hbase(main):006:0> whoami
Retorna:
root (auth:SIMPLE)
    groups: root

hbase(main):007:0>

## Help -Que mostra uma ajuda geral dos comando do Hbase
Retorna:
hbase(main):007:0> help
HBase Shell, version 1.2.6, rUnknown, Mon May 29 02:25:32 CDT 2017
Type 'help "COMMAND"', (e.g. 'help "get"' -- the quotes are necessary) for help on a specific command.
Commands are grouped. Type 'help "COMMAND_GROUP"', (e.g. 'help "general"') for help on a command group.

COMMAND GROUPS:
  Group name: general
  Commands: status, table_help, version, whoami

  Group name: ddl
  Commands: alter, alter_async, alter_status, create, describe, disable, disable_all, drop, drop_all, enable, enable_all, exists, get_table, is_disabled, is_enabled, list, locate_region, show_filters

  Group name: namespace
  Commands: alter_namespace, create_namespace, describe_namespace, drop_namespace, list_namespace, list_namespace_tables

  Group name: dml
  Commands: append, count, delete, deleteall, get, get_counter, get_splits, incr, put, scan, truncate, truncate_preserve

  Group name: tools
  Commands: assign, balance_switch, balancer, balancer_enabled, catalogjanitor_enabled, catalogjanitor_run, catalogjanitor_switch, close_region, compact, compact_rs, flush, major_compact, merge_region, move, normalize, normalizer_enabled, normalizer_switch, split, trace, unassign, wal_roll, zk_dump

  Group name: replication
  Commands: add_peer, append_peer_tableCFs, disable_peer, disable_table_replication, enable_peer, enable_table_replication, list_peers, list_replicated_tables, remove_peer, remove_peer_tableCFs, set_peer_tableCFs, show_peer_tableCFs

  Group name: snapshots
  Commands: clone_snapshot, delete_all_snapshot, delete_snapshot, list_snapshots, restore_snapshot, snapshot

  Group name: configuration
  Commands: update_all_config, update_config

  Group name: quotas
  Commands: list_quotas, set_quota

  Group name: security
  Commands: grant, list_security_capabilities, revoke, user_permission

  Group name: procedures
  Commands: abort_procedure, list_procedures

  Group name: visibility labels
  Commands: add_labels, clear_auths, get_auths, list_labels, set_auths, set_visibility

SHELL USAGE:
Quote all names in HBase Shell such as table and column names.  Commas delimit
command parameters.  Type <RETURN> after entering a command to run it.
Dictionaries of configuration used in the creation and alteration of tables are
Ruby Hashes. They look like this:

  {'key1' => 'value1', 'key2' => 'value2', ...}

and are opened and closed with curley-braces.  Key/values are delimited by the
'=>' character combination.  Usually keys are predefined constants such as
NAME, VERSIONS, COMPRESSION, etc.  Constants do not need to be quoted.  Type
'Object.constants' to see a (messy) list of all constants in the environment.

If you are using binary keys or values and need to enter them in the shell, use
double-quote'd hexadecimal representation. For example:

  hbase> get 't1', "key\x03\<prev>f\xcd"
  hbase> get 't1', "key\003\023\011"
  hbase> put 't1', "test\xef\xff", 'f1:', "\x01\<prev>3\<prev>0"

The HBase shell is the (J)Ruby IRB with the above HBase-specific commands added.
For more on the HBase Shell, see http://hbase.apache.org/book.html
hbase(main):008:0>

## Help "Comando" - Ahuda de um coando especifico
hbase(main):010:0> help 'list'
List all tables in hbase. Optional regular expression parameter could
be used to filter the output. Examples:

  hbase> list
  hbase> list 'abc.*'
  hbase> list 'ns:abc.*'
  hbase> list 'ns:.*'
hbase(main):011:0>

## 1. Criar a tabela ‘controle’ com os dados:
?? (Colocar a imagem da aula 10)

## Chave: id
## Família de Coluna: produto e fornecedor
## id,produto,fornecedor,nome,qtd,nome,estado

## Resposta:

hbase(main):012:0* create 'controle',{NAME=>'produto'},{NAME=>'fornecedor'}

Retorno:
0 row(s) in 1.4100 seconds

=> Hbase::Table - controle
hbase(main):013:0>

1,ram,100,TI Comp,SP
2,hd,50,Peças PC,MG
3,mouse,150,Inf Tec,SP


=> Hbase::Table - controle
hbase(main):013:0> put 'controle', '1','produto:nome','ram'
0 row(s) in 0.2000 seconds

hbase(main):014:0> put 'controle', '2','produto:nome','hd'
0 row(s) in 0.0170 seconds

hbase(main):015:0> put 'controle', '3','produto:nome','mouse'
0 row(s) in 0.0120 seconds

hbase(main):016:0> scan 'controle'
ROW                                           COLUMN+CELL
 1                                            column=produto:nome, timestamp=1645177898323, value=ram
 2                                            column=produto:nome, timestamp=1645177974580, value=hd
 3                                            column=produto:nome, timestamp=1645178002503, value=mouse
3 row(s) in 0.0440 seconds

hbase(main):017:0> put 'controle', '1','produto:qtd','100'
0 row(s) in 0.0130 seconds

hbase(main):018:0> put 'controle', '2','produto:qtd','50'
0 row(s) in 0.0100 seconds

hbase(main):019:0> put 'controle', '3','produto:qtd','150'
0 row(s) in 0.0080 seconds

hbase(main):020:0> scan 'controle'
ROW                                           COLUMN+CELL
 1                                            column=produto:nome, timestamp=1645177898323, value=ram
 1                                            column=produto:qtd, timestamp=1645179377418, value=100
 2                                            column=produto:nome, timestamp=1645177974580, value=hd
 2                                            column=produto:qtd, timestamp=1645179389375, value=50
 3                                            column=produto:nome, timestamp=1645178002503, value=mouse
 3                                            column=produto:qtd, timestamp=1645179431062, value=150
3 row(s) in 0.0400 seconds

hbase(main):021:0>

#Inserindo fornecedor
hbase(main):022:0> put 'controle', '2','fornecedor:nome','Peças Pc'
0 row(s) in 0.0100 seconds

hbase(main):023:0> put 'controle', '1','fornecedor:nome','ti Comp'
0 row(s) in 0.0060 seconds

hbase(main):024:0> scan 'controle'
ROW                                           COLUMN+CELL
 1                                            column=fornecedor:nome, timestamp=1645179731742, value=ti Comp
 1                                            column=produto:nome, timestamp=1645177898323, value=ram
 1                                            column=produto:qtd, timestamp=1645179377418, value=100
 2                                            column=fornecedor:nome, timestamp=1645179712415, value=Pe\xC3\xA7as Pc
 2                                            column=produto:nome, timestamp=1645177974580, value=hd
 2                                            column=produto:qtd, timestamp=1645179389375, value=50
 3                                            column=fornecedor:nome, timestamp=1645179678223, value=Inf Tec
 3                                            column=produto:nome, timestamp=1645178002503, value=mouse
 3                                            column=produto:qtd, timestamp=1645179431062, value=150
3 row(s) in 0.0590 seconds
33Inserindo a UF
hbase(main):025:0>
hbase(main):025:0> put 'controle', '1','fornecedor:estado','SP'
0 row(s) in 0.0110 seconds

hbase(main):026:0> put 'controle', '2','fornecedor:estado','MG'
0 row(s) in 0.0080 seconds

hbase(main):027:0> put 'controle', '3','fornecedor:estado','SP'
0 row(s) in 0.0120 seconds

hbase(main):028:0> sacn 'controle'
NoMethodError: undefined method `sacn' for #<Object:0x798dad3d>

hbase(main):029:0> scan 'controle'
ROW                                           COLUMN+CELL
 1                                            column=fornecedor:estado, timestamp=1645179918213, value=SP
 1                                            column=fornecedor:nome, timestamp=1645179731742, value=ti Comp
 1                                            column=produto:nome, timestamp=1645177898323, value=ram
 1                                            column=produto:qtd, timestamp=1645179377418, value=100
 2                                            column=fornecedor:estado, timestamp=1645179959569, value=MG
 2                                            column=fornecedor:nome, timestamp=1645179712415, value=Pe\xC3\xA7as Pc
 2                                            column=produto:nome, timestamp=1645177974580, value=hd
 2                                            column=produto:qtd, timestamp=1645179389375, value=50
 3                                            column=fornecedor:estado, timestamp=1645179972822, value=SP
 3                                            column=fornecedor:nome, timestamp=1645179678223, value=Inf 
 3                                            column=produto:nome, timestamp=1645178002503, value=mouse
 3                                            column=produto:qtd, timestamp=1645179431062, value=150
3 row(s) in 0.0350 seconds

Obs: Existem ferramentas capaz de fazermos a inserção de forma mais fácil.Dessa forma tem o objetivo de entendimento de como funciona. 

## 2. Listar as tabelas e verificar a estrutura da tabela ‘controle’
Resposta:
## Listando a tabela
hbase(main):030:0> list 'controle'

Retorno:
TABLE
controle
1 row(s) in 0.0380 seconds

=> ["controle"]

## Vendo a estrutura da tabela
hbase(main):031:0> describe 'controle'
Table controle is ENABLED
controle
COLUMN FAMILIES DESCRIPTION
{NAME => 'fornecedor', BLOOMFILTER => 'ROW', VERSIONS => '1', IN_MEMORY => 'false', KEEP_DELETED_CELLS => 'FALSE', DATA_BLOCK_ENCODING => 'NONE', TTL => 'FOREVER', COMPRESSION =
> 'NONE', MIN_VERSIONS => '0', BLOCKCACHE => 'true', BLOCKSIZE => '65536', REPLICATION_SCOPE => '0'}
{NAME => 'produto', BLOOMFILTER => 'ROW', VERSIONS => '1', IN_MEMORY => 'false', KEEP_DELETED_CELLS => 'FALSE', DATA_BLOCK_ENCODING => 'NONE', TTL => 'FOREVER', COMPRESSION => '
NONE', MIN_VERSIONS => '0', BLOCKCACHE => 'true', BLOCKSIZE => '65536', REPLICATION_SCOPE => '0'}
2 row(s) in 0.0530 seconds

hbase(main):032:0> 

## 3. Contar o número de registros da tabela ‘controle’
Resposta:
hbase(main):033:0> count 'controle'
3 row(s) in 0.0270 seconds

=> 3
hbase(main):034:0>

## 4. Alterar  a família de coluna produto para 3 versões
Resposta:
hbase(main):034:0> alter 'controle', {NAME=>'produto',VERSIONS=>3}
Updating all regions with the new schema...
0/1 regions updated.
1/1 regions updated.
Done.
0 row(s) in 3.0230 seconds

hbase(main):035:0> describe 'controle'
Table controle is ENABLED
controle
COLUMN FAMILIES DESCRIPTION
{NAME => 'fornecedor', BLOOMFILTER => 'ROW', VERSIONS => '1', IN_MEMORY => 'false', KEEP_DELETED_CELLS => 'FALSE', DATA_BLOCK_ENCODING => 'NONE', TTL => 'FOREVER', COMPRESSION =
> 'NONE', MIN_VERSIONS => '0', BLOCKCACHE => 'true', BLOCKSIZE => '65536', REPLICATION_SCOPE => '0'}
{NAME => 'produto', BLOOMFILTER => 'ROW', VERSIONS => '3', IN_MEMORY => 'false', KEEP_DELETED_CELLS => 'FALSE', DATA_BLOCK_ENCODING => 'NONE', TTL => 'FOREVER', COMPRESSION => '
NONE', MIN_VERSIONS => '0', BLOCKCACHE => 'true', BLOCKSIZE => '65536', REPLICATION_SCOPE => '0'}
2 row(s) in 0.0220 seconds

hbase(main):036:0> 

Obs: Alterar a versão possibilita voçê alterar o valor de campos existente, sem perder as informações anteriores (iria substituir o valor anterior).As informações são atualizadas emreal time, não permite de forma direta altera-las  

## 5. Alterar a quantidade para 200 do id 2
Resposta com erro:
hbase(main):036:0> put 'controle','produto:qtd','200'

ERROR: wrong number of arguments (3 for 4)

Here is some help for this command:
Put a cell 'value' at specified table/row/column and optionally
timestamp coordinates.  To put a cell value into table 'ns1:t1' or 't1'
at row 'r1' under column 'c1' marked with the time 'ts1', do:

  hbase> put 'ns1:t1', 'r1', 'c1', 'value'
  hbase> put 't1', 'r1', 'c1', 'value'
  hbase> put 't1', 'r1', 'c1', 'value', ts1
  hbase> put 't1', 'r1', 'c1', 'value', {ATTRIBUTES=>{'mykey'=>'myvalue'}}
  hbase> put 't1', 'r1', 'c1', 'value', ts1, {ATTRIBUTES=>{'mykey'=>'myvalue'}}
  hbase> put 't1', 'r1', 'c1', 'value', ts1, {VISIBILITY=>'PRIVATE|SECRET'}

The same commands also can be run on a table reference. Suppose you had a reference
t to table 't1', the corresponding command would be:

  hbase> t.put 'r1', 'c1', 'value', ts1, {ATTRIBUTES=>{'mykey'=>'myvalue'}}


hbase(main):037:0>

## Ocorreu o erro anterior, pois esquecemos de colocar a chave, no caso 2
## Resposta correta
hbase(main):039:0* put 'controle','2','produto:qtd','200'
0 row(s) in 0.0110 seconds

hbase(main):040:0> scan 'controle'
ROW                                           COLUMN+CELL
 1                                            column=fornecedor:estado, timestamp=1645179918213, value=SP
 1                                            column=fornecedor:nome, timestamp=1645179731742, value=ti Comp
 1                                            column=produto:nome, timestamp=1645177898323, value=ram
 1                                            column=produto:qtd, timestamp=1645179377418, value=100
 2                                            column=fornecedor:estado, timestamp=1645179959569, value=MG
 2                                            column=fornecedor:nome, timestamp=1645179712415, value=Pe\xC3\xA7as Pc
 2                                            column=produto:nome, timestamp=1645177974580, value=hd
 2                                            column=produto:qtd, timestamp=1645181490981, value=200
 3                                            column=fornecedor:estado, timestamp=1645179972822, value=SP
 3                                            column=fornecedor:nome, timestamp=1645179678223, value=Inf Tec
 3                                            column=produto:nome, timestamp=1645178002503, value=mouse
 3                                            column=produto:qtd, timestamp=1645179431062, value=150
3 row(s) in 0.0470 seconds


## 6. Pesquisar as versões do id 2  da coluna quantidade

Resposta: de 4 formas com outro campo
hbase(main):009:0> get 'controle','2', {COLUMNS=>'produto',VERSIONS=>2}
COLUMN                                        CELL
 produto:nome                                 timestamp=1645177974580, value=hd
 produto:qtd                                  timestamp=1645181490981, value=200
2 row(s) in 0.0340 seconds

hbase(main):010:0> get 'controle','2', {COLUMNS=>'produto:qtd',VERSIONS=>2}
COLUMN                                        CELL
 produto:qtd                                  timestamp=1645181490981, value=200
1 row(s) in 0.0150 seconds

hbase(main):011:0> get 'controle','2',{COLUMNS=> ['produto:qtd','fornecedor:nome'],VERSIONS=>2}
COLUMN                                        CELL
 fornecedor:nome                              timestamp=1645179712415, value=Pe\xC3\xA7as Pc
 produto:qtd                                  timestamp=1645181490981, value=200
2 row(s) in 0.0190 seconds

hbase(main):012:0> get 'controle','2',{COLUMNS=> ['produto:qtd','fornecedor'],VERSIONS=>2}
COLUMN                                        CELL
 fornecedor:estado                            timestamp=1645179959569, value=MG
 fornecedor:nome                              timestamp=1645179712415, value=Pe\xC3\xA7as Pc
 produto:qtd                                  timestamp=1645181490981, value=200
3 row(s) in 0.0120 seconds


hbase(main):012:0>  


## 7. Excluir os id do estado de SP
Iremos fazer filtrando, para isso vamos usar o scan

## Listando tudo do estado
hbase(main):013:0>
hbase(main):013:0> scan 'controle' ,{COLUMNS=> 'fornecedor:estado'}
ROW                                           COLUMN+CELL
 1                                            column=fornecedor:estado, timestamp=1645179918213, value=SP
 2                                            column=fornecedor:estado, timestamp=1645179959569, value=MG
 3                                            column=fornecedor:estado, timestamp=1645179972822, value=SP
3 row(s) in 0.0270 seconds

## Listando com LIMIT
hbase(main):014:0> scan 'controle' ,{COLUMNS=> 'fornecedor:estado',LIMIT=>5}
ROW                                           COLUMN+CELL
 1                                            column=fornecedor:estado, timestamp=1645179918213, value=SP
 2                                            column=fornecedor:estado, timestamp=1645179959569, value=MG
 3                                            column=fornecedor:estado, timestamp=1645179972822, value=SP
3 row(s) in 0.0230 seconds

## Filtrando com "FILTER"
hbase(main):015:0> scan 'controle' ,{COLUMNS=> 'fornecedor:estado',LIMIT=>5, FILTER => "ValueFilter(=, 'binary:SP')"}
ROW                                           COLUMN+CELL
 1                                            column=fornecedor:estado, timestamp=1645179918213, value=SP
 3                                            column=fornecedor:estado, timestamp=1645179972822, value=SP
2 row(s) in 0.0530 seconds

## Resposta 
hbase(main):016:0> deleteall 'controle','1'
0 row(s) in 0.0570 seconds

hbase(main):017:0> deleteall 'controle','3'
0 row(s) in 0.0130 seconds

hbase(main):018:0>

## Conferindo a exclusão
hbase(main):018:0> count 'controle'
1 row(s) in 0.0180 seconds

=> 1
hbase(main):019:0> scan 'controle'
ROW                                           COLUMN+CELL
 2                                            column=fornecedor:estado, timestamp=1645179959569, value=MG
 2                                            column=fornecedor:nome, timestamp=1645179712415, value=Pe\xC3\xA7as Pc
 2                                            column=produto:nome, timestamp=1645177974580, value=hd
 2                                            column=produto:qtd, timestamp=1645181490981, value=200
1 row(s) in 0.0360 seconds

8. Deletar a coluna estado da chave 2
## Resposta 
hbase(main):021:0> delete 'controle', '2', 'fornecedor:estado'
0 row(s) in 0.0050 seconds

## Podemos verificar no item 9 

9. Pesquisar toda a tabela controle
## Resposta
hbase(main):024:0> scan  'controle'
ROW                                          COLUMN+CELL
 2                                           column=fornecedor:nome, timestamp=1645179712415, value=Pe\xC3\xA7as Pc
 2                                           column=produto:nome, timestamp=1645177974580, value=hd
 2                                           column=produto:qtd, timestamp=1645181490981, value=200
1 row(s) in 0.0250 seconds

10. Clicar no botão de Enviar Tarefa, e enviar o texto: ok