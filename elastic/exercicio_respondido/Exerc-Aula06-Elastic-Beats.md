# Exerc-Aula06-Elastic-Beats

## 1) Fazer o download do filebeat
marco@DESKTOP-G2455QH:~/treinamentos/elastic$ <code>
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat 7.9.2-linux x86_64.tar.gz
 </code>


Retorna:
<prev>
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 87951  100 87951    0     0  87951      0  0:00:01  0:00:01 --:--:-- 87951
</prev>

## 2º) Fazendo a descompactação:
marco@DESKTOP-G2455QH:~/treinamentos/elastic$<code>  tar xzvf filebeat-7.9.2-linux-x86_64.tar.gz
</code>
Retorna:
filebeat-7.9.2-linux-x86_64/module/zeek/syslog/config/syslog.yml
filebeat-7.9.2-linux-x86_64/module/zeek/syslog/ingest/
filebeat-7.9.2-linux-x86_64/module/zeek/syslog/ingest/pipeline.yml
filebeat-7.9.2-linux-x86_64/module/zeek/syslog/manifest.yml
filebeat-7.9.2-linux-x86_64/module/zeek/traceroute/
filebeat-7.9.2-linux-x86_64/module/zeek/traceroute/config/
filebeat-7.9.2-linux-x86_64/module/zeek/traceroute/config/traceroute.yml
filebeat-7.9.2-linux-x86_64/module/zeek/traceroute/ingest/
filebeat-7.9.2-linux-x86_64/module/zeek/traceroute/ingest/pipeline.yml
filebeat-7.9.2-linux-x86_64/module/zeek/traceroute/manifest.yml
filebeat-7.9.2-linux-x86_64/module/zeek/tunnel/
filebeat-7.9.2-linux-x86_64/module/zeek/tunnel/config/
filebeat-7.9.2-linux-x86_64/module/zeek/tunnel/config/tunnel.yml
filebeat-7.9.2-linux-x86_64/module/zeek/tunnel/ingest/
filebeat-7.9.2-linux-x86_64/module/zeek/tunnel/ingest/pipeline.yml
filebeat-7.9.2-linux-x86_64/module/zeek/tunnel/manifest.yml
filebeat-7.9.2-linux-x86_64/module/zeek/weird/
filebeat-7.9.2-linux-x86_64/module/zeek/weird/config/
filebeat-7.9.2-linux-x86_64/module/zeek/weird/config/weird.yml
filebeat-7.9.2-linux-x86_64/module/zeek/weird/ingest/
filebeat-7.9.2-linux-x86_64/module/zeek/weird/ingest/pipeline.yml
filebeat-7.9.2-linux-x86_64/module/zeek/weird/manifest.yml
filebeat-7.9.2-linux-x86_64/module/zeek/x509/
filebeat-7.9.2-linux-x86_64/module/zeek/x509/config/
filebeat-7.9.2-linux-x86_64/module/zeek/x509/config/x509.yml
filebeat-7.9.2-linux-x86_64/module/zeek/x509/ingest/
filebeat-7.9.2-linux-x86_64/module/zeek/x509/ingest/pipeline.json
filebeat-7.9.2-linux-x86_64/module/zeek/x509/manifest.yml
filebeat-7.9.2-linux-x86_64/module/zscaler/
filebeat-7.9.2-linux-x86_64/module/zscaler/README.md
filebeat-7.9.2-linux-x86_64/module/zscaler/zia/
filebeat-7.9.2-linux-x86_64/module/zscaler/zia/config/
filebeat-7.9.2-linux-x86_64/module/zscaler/zia/config/input.yml
filebeat-7.9.2-linux-x86_64/module/zscaler/zia/config/liblogparser.js
filebeat-7.9.2-linux-x86_64/module/zscaler/zia/config/pipeline.js
filebeat-7.9.2-linux-x86_64/module/zscaler/zia/ingest/
filebeat-7.9.2-linux-x86_64/module/zscaler/zia/ingest/pipeline.yml
filebeat-7.9.2-linux-x86_64/module/zscaler/zia/manifest.yml
marco@DESKTOP-G2455QH:~/treinamentos/elastic$

### Erro

marco@DESKTOP-G2455QH:~/treinamentos/elastic$ cd  filebeat-7.9.2-linux-x86_64/
marco@DESKTOP-G2455QH:~/treinamentos/elastic/filebeat-7.9.2-linux-x86_64$ ./filebeat test config
Exiting: error setting default paths: Failed to create data path /home/marco/treinamentos/elastic/filebeat-7.9.2-linux-x86_64/data: mkdir /home/marco/treinamentos/elastic/filebeat-7.9.2-linux-x86_64/data: permission denied
marco@DESKTOP-G2455QH:~/treinamentos/elastic/filebeat-7.9.2-linux-x86_64$ sudo ./filebeat test config
[sudo] password for marco:
Exiting: error loading config file: config file ("filebeat.yml") must be owned by the user identifier (uid=0) or root
marco@DESKTOP-G2455QH:~/treinamentos/elastic/filebeat-7.9.2-linux-x86_64$
marco@DESKTOP-G2455QH:~/treinamentos/elastic/filebeat-7.9.2-linux-x86_64$


### 

# 1.Enviar o arquivo <local>/paris 925.logs com uso do Filebeat
# 2.Verificar a quantidade de documentos do índice criado pelo Filebeat e visualizar seus 10 primeiros
documentos






# 3.Monitorar as métricas do docker

•Referência:
https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat module docker.html

•Encontrar o socket do Docker
$sudo find / name docker.sock

# 4.Verificar a quantidade de documentos do índice criado pelo Metricbeat e visualizar seus 10 primeiros
documentos

# 5.Monitorar o site https://www.elastic.co/pt/ com uso do Heartbeat

# 6.Verificar a quantidade de documentos do índice criado pelo Heartbeat e visualizar seus 10 primeiros
documentos