Como Remover Imagens no Docker
Antes de usar o Docker, lembre-se que você precisa tê-lo instalado em sua VPS. Em seguida, você pode acessar o seu servidor usando PuTTY! Se estiver enfrentando problemas, confira nosso tutorial!

Docker: Remover Imagens
Aplique a opção –a para visualizar uma única ou múltiplas imagens usando o Image ID de cada imagem do sistema.

A partir desse resumo, selecione os IDs da imagem da qual você precisa se livrar e então use o comando rmi, como mostraremos no exemplo abaixo.

Você pode selecionar múltiplas imagens ao escolher os seus Image IDs. Os seguintes comandos ajudam a remover um arquivo específico ou arquivos diferentes:

Comando para a ver a lista:

$ docker images –a
Comando para remover uma imagem:

$ docker image rmi <image_id>
Comando para remover múltiplas imagens:

$ docker images rmi <image_id> <image_id>
Docker: Remover Imagens Pendentes
Imagens pendentes são aquelas que não possuem relações com imagens etiquetadas. Normalmente essas imagens não estão sendo utilizadas e apenas ocupam espaço em disco. Podemos encontrá-las ao usar a opção de filtro -f com a linha dangling=true. Elas podem ser eliminadas posteriormente.

Para ver as imagens pendentes use o comando abaixo:

$ docker images –f dangling=true
Para deletar ou remover as imagens pendentes, use:

$ docker images purge
Docker: Remover Imagens Através de um Padrão
Remover determinadas imagens é algo fácil e rápido no Docker. Temos que rodar comandos específicos dentro do terminal para ver a lista das muitas imagens, junto dos padrões que combinam com elas.

A seguir, usaremos o comando awk com o Image ID para apagar a imagem específica.

Se quisermos remover as páginas de acordo com um padrão específico, podemos fazê-lo em apenas alguns comandos! Primeiramente, precisamos usar o Docker junto de um comando grep para listar as imagens e então deletá-las com o comando awk.

Para especificar seu padrão no terminal, use:

$ docker images –a | grep "pattern"
Para remover a imagem, use:

$ docker images –a | grep "<ImageId>" | awk '{<Print $1>}' | xargs docker rm
Docker: Remover Container
Para remover um container no Docker, você deve seguir passos similares àqueles de quando você remove uma imagem. Primeiramente, use a opção -a para listar os containers e então utilize o comando rm para deletar um único ou múltiplos containers:

$ docker container -a
Para remover um único container, use o comando abaixo:

$ docker container rm <container ID>
Para deletar múltiplos containers, digite:

$ docker container rm <container ID> <container ID>
Docker: Remover Container Enquanto Sai de uma Aplicação
Se você não precisa de um container depois de criá-lo, simplesmente use o comando –rm para deletá-lo.

$ docker run –-rm <container_name>
Docker: Remover Container Através de um Padrão
Para visualizar todos os containers que atendem ao seu padrão, use o comando abaixo. O processo é praticamente idêntico ao que você usaria para remover imagens através de um padrão:

$ docker ps -a |  grep "pattern”
Em seguida, usaremos o comando rep jungo com o awk para remover o container:

$ docker ps -a | grep "pattern" | awk '{print $1}' | xargs docker rmi
Docker: Remover Volumes
Use o comando ls para procurar na lista de volumes e conferir que nomes de volumes são aqueles que você deseja remover. Em seguida, use o comando rm conforme mostrado no exemplo:

Listar volumes:

$ docker volume ls
Remover um único ou múltiplos volumes:

$ docker volume rm <volume_name> <volume_name>
Docker: Remover Volumes Pendentes
Volumes não existiriam sem containers. Se você remover containers e deixar os volumes vazios, eles não serão automaticamente removidos. Para remover esses volumes, podemos seguir um processo similar ao usado para remover imagens pendentes:

Primeiramente, podemos listar todas as imagens pendentes com a opção de filtro -f e então usar o comando prune para remover aquelas que estão pendentes.

Listar volumes pendentes:

$ docker volume ls –f dangling=true
Remover volumes pendentes:

$ docker volume prune
Docker: Remover Container and seus Volumes
Volumes sem nomes podem ser deletados junto de seus containers usam a opção –v:

$ docker rm -v <container_name>
Resumo
O Docker permite que você trabalhe num ambiente livre de caos. Mas, depois de usar o Docker por um longo período de tempo, você pode ter sobras de imagens, volumes e containers que estão apenas tomando valioso espaço de disco.

Neste tutorial, mostramos alguns fatores básicos do Docker: remover containers, imagens e volumes de acordo com diferentes especificações.



Iniciar todos os serviços
$docker compose up -d

o Parar os serviços
$docker compose stop

oIniciar os serviços
$docker compose start

o Término do treinamento
•Matar os serviços
$docker compose dowm

•Apagar todos os volumes sem uso
$docker volume prune
ocat docker compose.yml

oVisualizar os container
•Ativos
$ docker ps
•Todos
$ docker ps a

Executar comandos no container
••$ docker exec it <container> <comando>

oVisualizar os logs
••$ docker logs <container>

oEnviar arquivos
••$ docker cp <diretório> <container>:/<

o Acessos de ferramentas
•Server de Kafka
o$ docker exec it broker bash

•Confluent Control Center
ohttp://localhost:9021

Confluent Portas 
o Portas Componentes            Portas Default
Apache Kafka brokers            9092
Confluent Control Center        9021
Kafka Connect REST API          8083
KSQL Server REST API            8088
REST Proxy                      8082
Schema Registry REST API        8081
ZooKeeper                       2181


https://stack.desenvolvedor.expert/appendix/docker/comandos.html

Comandos básicos
Para utilização do Docker é necessário conhecer alguns comandos e entender de forma clara e direta para que servem, assim como alguns exemplos de uso.

Não abordaremos os comandos de criação de imagem e tratamento de problemas (troubleshooting) no Docker, pois têm capítulos específicos para o detalhamento.

Executando um container
Para iniciar um container é necessário saber a partir de qual imagem será executado. Para listar as imagens que seu Docker host tem localmente, execute o comando abaixo:

docker image list
As imagens retornadas estão presentes no seu Docker host e não demandam qualquer download da nuvem pública do Docker, a menos que deseje atualizá-la. Para atualizar a imagem basta executar o comando abaixo:

docker image pull python
Usamos a imagem chamada python como exemplo, mas caso deseje atualizar qualquer outra imagem, basta colocar seu nome no lugar de python.

Caso deseje inspecionar a imagem que acabou de atualizar, basta usar o comando abaixo:

docker image inspect python
O comando inspect é responsável por informar todos os dados referentes à imagem.

Agora que temos a imagem atualizada e inspecionada, podemos iniciar o container. Mas antes de simplesmente copiar e colar o comando, vamos entender como ele realmente funciona.

docker container run <parâmetros> <imagem> <CMD> <argumentos>
Os parâmetros mais utilizados na execução do container são:

Parâmetro	Explicação
-d	Execução do container em background
-i	Modo interativo. Mantém o STDIN aberto mesmo sem console anexado
-t	Aloca uma pseudo TTY
--rm	Automaticamente remove o container após finalização (Não funciona com -d)
--name	Nomear o container
-v	Mapeamento de volume
-p	Mapeamento de porta
-m	Limitar o uso de memória RAM
-c	Balancear o uso de CPU
Segue um exemplo simples no seguinte comando:

docker container run -it --rm --name meu_python python bash
De acordo com o comando acima, será iniciado um container com o nome meu_python, criado a partir da imagem python e o processo executado nesse container será o bash.

Vale lembrar que, caso o CMD não seja especificado no comando docker container run, é utilizado o valor padrão definido no Dockerfile da imagem utilizada. No nosso caso é python e seu comando padrão executa o binário python, ou seja, se não fosse especificado o bash, no final do comando de exemplo acima, ao invés de um shell bash do GNU/Linux, seria exibido um shell do python.

Mapeamento de volumes
Para realizar mapeamento de volume basta especificar qual origem do dado no host e onde deve ser montado dentro do container.

docker container run -it --rm -v "<host>:<container>" python
O uso de armazenamento é melhor explicado em capítulos futuros, por isso não detalharemos o uso desse parâmetro.

Mapeamento de portas
Para realizar o mapeamento de portas basta saber qual porta será mapeada no host e qual deve receber essa conexão dentro do container.

docker container run -it --rm -p "<host>:<container>" python
Um exemplo com a porta 80 do host para uma porta 8080 dentro do container tem o seguinte comando:

docker container run -it --rm -p 80:8080 python
Com o comando acima temos a porta 80 acessível no Docker host que repassa todas as conexões para a porta 8080 dentro do container. Ou seja, não é possível acessar a porta 8080 no endereço IP do Docker host, pois essa porta está acessível apenas dentro do container que é isolada a nível de rede, como já dito anteriormente.

Gerenciamento dos recursos
Na inicialização dos containers é possível especificar alguns limites de utilização dos recursos. Trataremos aqui apenas de memória RAM e CPU, os mais utilizados.

Para limitar o uso de memória RAM que pode ser utilizada por esse container, basta executar o comando abaixo:

docker container run -it --rm -m 512M python
Com o comando acima estamos limitando esse container a utilizar somente 512 MB de RAM.

Para balancear o uso da CPU pelos containers, utilizamos especificação de pesos para cada container, quanto menor o peso, menor sua prioridade no uso. Os pesos podem oscilar de 1 a 1024.

Caso não seja especificado o peso do container, ele usará o maior peso possível, nesse caso 1024.

Usaremos como exemplo o peso 512:

docker container run -it --rm -c 512 python
Para entendimento, vamos imaginar que três containers foram colocados em execução. Um deles tem o peso padrão 1024 e dois têm o peso 512. Caso os três processos demandem toda CPU o tempo de uso deles será dividido da seguinte maneira:

O processo com peso 1024 usará 50% do tempo de processamento
Os dois processos com peso 512 usarão 25% do tempo de processamento, cada.
Verificando a lista de containers
Para visualizar a lista de containers de um determinado Docker host utilizamos o comando docker ps.

Esse comando é responsável por mostrar todos os containers, mesmo aqueles não mais em execução.

docker container list <parâmetros>
Os parâmetros mais utilizados na execução do container são:

Parâmetro	Explicação
-a	Lista todos os containers, inclusive os desligados
-l	Lista os últimos containers, inclusive os desligados
-n	Lista os últimos N containers, inclusive os desligados
-q	Lista apenas os ids dos containers, ótimo para utilização em scripts
Gerenciamento de containers
Uma vez iniciado o container a partir de uma imagem é possível gerenciar a utilização com novos comandos.

Caso deseje desligar o container basta utilizar o comando docker stop. Ele recebe como argumento o ID ou nome do container. Ambos os dados podem ser obtidos com o docker ps, explicado no tópico anterior.

Um exemplo de uso:

docker container stop meu_python
No comando acima, caso houvesse um container chamado meu_python em execução, ele receberia um sinal SIGTERM e, caso não fosse desligado, receberia um SIGKILL depois de 10 segundos.

Caso deseje reiniciar o container que foi desligado e não iniciar um novo, basta executar o comando docker start:

docker container start meu_python
Vale ressaltar que a ideia dos containers é a de serem descartáveis. Caso você use o mesmo container por muito tempo sem descartá-lo, provavelmente está usando o Docker incorretamente. O Docker não é uma máquina, é um processo em execução. E, como todo processo, deve ser descartado para que outro possa tomar seu lugar na reinicialização do mesmo.

