
marco@DESKTOP-G2455QH:~/treinamentos/elastic$ docker-compose start
Starting elasticsearch ... done
Starting kibana        ... done
Starting logstash      ... done
marco@DESKTOP-G2455QH:~/treinamentos/elastic$ cd filebeat-7.9.2-linux-x86_64/
marco@DESKTOP-G2455QH:~/treinamentos/elastic/filebeat-7.9.2-linux-x86_64$ ./filebeat test config
Config OK
marco@DESKTOP-G2455QH:~/treinamentos/elastic/filebeat-7.9.2-linux-x86_64$ ./filebeat test output
elasticsearch: http://localhost:9200...
  parse url... OK
  connection...
    parse host... OK
    dns lookup... OK
    addresses: 127.0.0.1
    dial up... OK
  TLS... WARN secure connection disabled
  talk to server... OK
  version: 7.9.2
marco@DESKTOP-G2455QH:~/treinamentos/elastic/filebeat-7.9.2-linux-x86_64$

Mudando a permissão do filebeat.yml

marco@DESKTOP-G2455QH:~/treinamentos/elastic/filebeat-7.9.2-linux-x86_64$ sudo chown root filebeat.yml
[sudo] password for marco:

Verificando:
marco@DESKTOP-G2455QH:~/treinamentos/elastic/filebeat-7.9.2-linux-x86_64$ ls -la
total 103376
drwxr-xr-x  7 marco marco     4096 Mar 30 22:25 .
drwxr-xr-x  7 marco marco     4096 Mar 30 21:58 ..
-rw-r--r--  1 marco marco       41 Sep 22  2020 .build_hash.txt
-rw-r--r--  1 marco marco    13675 Sep 22  2020 LICENSE.txt
-rw-r--r--  1 marco marco  8440372 Sep 22  2020 NOTICE.txt
-rw-r--r--  1 marco marco      809 Sep 22  2020 README.md
drwxr-x---  2 marco marco     4096 Mar 30 22:25 data
-rw-r--r--  1 marco marco  2402200 Sep 22  2020 fields.yml
-rwxr-xr-x  1 marco marco 94826768 Sep 22  2020 filebeat
-rw-r--r--  1 marco marco   114090 Sep 22  2020 filebeat.reference.yml
-rw-------  1 root  marco     9085 Mar 30 22:15 filebeat.yml
drwxr-xr-x  3 marco marco     4096 Sep 22  2020 kibana
drwx------  2 marco marco     4096 Mar 30 22:39 logs
drwxr-xr-x 60 marco marco     4096 Sep 22  2020 module
drwxr-xr-x  2 marco marco     4096 Sep 22  2020 modules.d
marco@DESKTOP-G2455QH:~/treinamentos/elastic/filebeat-7.9.2-linux-x86_64$