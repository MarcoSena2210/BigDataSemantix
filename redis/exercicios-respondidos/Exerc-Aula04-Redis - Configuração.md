# Exerc-Aula04 - Redis - Configuração

Dica: Todas as configurações que iremos fazer aqui,serão válidas emquando não paramos os serviços no docker.

Ao reiniciar o docker (subir o serviço), toda configuração do docker irá voltar ao seu estágio inicial.  

## 1. Visualizar todos os parâmetros de configuração
127.0.0.1:6379> <code>config get *</code>

Retorna:
<prev> 
 1) "rdbchecksum"
  2) "yes"
  3) "daemonize"
  4) "no"
  5) "io-threads-do-reads"
  6) "no"
  7) "lua-replicate-commands"
  8) "yes"
  9) "always-show-logo"
 10) "no"
 11) "protected-mode"
 12) "no"
 13) "rdbcompression"
 14) "yes"
 15) "rdb-del-sync-files"
 16) "no"
 17) "activerehashing"
 18) "yes"
 19) "stop-writes-on-bgsave-error"
 20) "yes"
 21) "set-proc-title"
 22) "yes"
 23) "dynamic-hz"
 24) "yes"
 25) "lazyfree-lazy-eviction"
 26) "no"
 27) "lazyfree-lazy-expire"
 28) "no"
 29) "lazyfree-lazy-server-del"
 30) "no"
 31) "lazyfree-lazy-user-del"
 32) "no"
 33) "lazyfree-lazy-user-flush"
 34) "no"
 35) "repl-disable-tcp-nodelay"
 36) "no"
 37) "repl-diskless-sync"
 38) "no"
 39) "gopher-enabled"
 40) "no"
 41) "aof-rewrite-incremental-fsync"
 42) "yes"
 43) "no-appendfsync-on-rewrite"
 44) "no"
 45) "cluster-require-full-coverage"
 46) "yes"
 47) "rdb-save-incremental-fsync"
 48) "yes"
 49) "aof-load-truncated"
 50) "yes"
 51) "aof-use-rdb-preamble"
 52) "yes"
 53) "cluster-replica-no-failover"
 54) "no"
 55) "cluster-slave-no-failover"
 56) "no"
 57) "replica-lazy-flush"
 58) "no"
 59) "slave-lazy-flush"
 60) "no"
 61) "replica-serve-stale-data"
 62) "yes"
 63) "slave-serve-stale-data"
 64) "yes"
 65) "replica-read-only"
 66) "yes"
 67) "slave-read-only"
 68) "yes"
 69) "replica-ignore-maxmemory"
 70) "yes"
 71) "slave-ignore-maxmemory"
 72) "yes"
 73) "jemalloc-bg-thread"
 74) "yes"
 75) "activedefrag"
 76) "no"
 77) "syslog-enabled"
 78) "no"
 79) "cluster-enabled"
 80) "no"
 81) "appendonly"
 82) "yes"
 83) "cluster-allow-reads-when-down"
 84) "no"
 85) "crash-log-enabled"
 86) "yes"
 87) "crash-memcheck-enabled"
 88) "yes"
 89) "use-exit-on-panic"
 90) "no"
 91) "disable-thp"
 92) "yes"
 93) "cluster-allow-replica-migration"
 94) "yes"
 95) "replica-announced"
 96) "yes"
 97) "aclfile"
 98) ""
 99) "unixsocket"
100) ""
101) "pidfile"
102) ""
103) "replica-announce-ip"
104) ""
105) "slave-announce-ip"
106) ""
107) "masteruser"
108) ""
109) "cluster-announce-ip"
110) ""
111) "syslog-ident"
112) "redis"
113) "dbfilename"
114) "dump.rdb"
115) "appendfilename"
116) "appendonly.aof"
117) "server_cpulist"
118) ""
119) "bio_cpulist"
120) ""
121) "aof_rewrite_cpulist"
122) ""
123) "bgsave_cpulist"
124) ""
125) "ignore-warnings"
126) ""
127) "proc-title-template"
128) "{title} {listen-addr} {server-mode}"
129) "masterauth"
130) ""
131) "requirepass"
132) ""
133) "supervised"
134) "no"
135) "syslog-facility"
136) "local0"
137) "repl-diskless-load"
138) "disabled"
139) "loglevel"
140) "notice"
141) "maxmemory-policy"
142) "noeviction"
143) "appendfsync"
144) "everysec"
145) "oom-score-adj"
146) "no"
147) "acl-pubsub-default"
148) "allchannels"
149) "sanitize-dump-payload"
150) "no"
151) "databases"
152) "16"
153) "port"
154) "6379"
155) "io-threads"
156) "1"
157) "auto-aof-rewrite-percentage"
158) "100"
159) "cluster-replica-validity-factor"
160) "10"
161) "cluster-slave-validity-factor"
162) "10"
163) "list-max-ziplist-size"
164) "-2"
165) "tcp-keepalive"
166) "300"
167) "cluster-migration-barrier"
168) "1"
169) "active-defrag-cycle-min"
170) "1"
171) "active-defrag-cycle-max"
172) "25"
173) "active-defrag-threshold-lower"
174) "10"
175) "active-defrag-threshold-upper"
176) "100"
177) "lfu-log-factor"
178) "10"
179) "lfu-decay-time"
180) "1"
181) "replica-priority"
182) "100"
183) "slave-priority"
184) "100"
185) "repl-diskless-sync-delay"
186) "5"
187) "maxmemory-samples"
188) "5"
189) "maxmemory-eviction-tenacity"
190) "10"
191) "timeout"
192) "0"
193) "replica-announce-port"
194) "0"
195) "slave-announce-port"
196) "0"
197) "tcp-backlog"
198) "511"
199) "cluster-announce-bus-port"
200) "0"
201) "cluster-announce-port"
202) "0"
203) "cluster-announce-tls-port"
204) "0"
205) "repl-timeout"
206) "60"
207) "repl-ping-replica-period"
208) "10"
209) "repl-ping-slave-period"
210) "10"
211) "list-compress-depth"
212) "0"
213) "rdb-key-save-delay"
214) "0"
215) "key-load-delay"
216) "0"
217) "active-expire-effort"
218) "1"
219) "hz"
220) "10"
221) "min-replicas-to-write"
222) "0"
223) "min-slaves-to-write"
224) "0"
225) "min-replicas-max-lag"
226) "10"
227) "min-slaves-max-lag"
228) "10"
229) "maxclients"
230) "10000"
231) "active-defrag-max-scan-fields"
232) "1000"
233) "slowlog-max-len"
234) "128"
235) "acllog-max-len"
236) "128"
237) "lua-time-limit"
238) "5000"
239) "cluster-node-timeout"
240) "15000"
241) "slowlog-log-slower-than"
242) "10000"
243) "latency-monitor-threshold"
244) "0"
245) "proto-max-bulk-len"
246) "536870912"
247) "stream-node-max-entries"
248) "100"
249) "repl-backlog-size"
250) "1048576"
251) "maxmemory"
252) "0"
253) "hash-max-ziplist-entries"
254) "512"
255) "set-max-intset-entries"
256) "512"
257) "zset-max-ziplist-entries"
258) "128"
259) "active-defrag-ignore-bytes"
260) "104857600"
261) "hash-max-ziplist-value"
262) "64"
263) "stream-node-max-bytes"
264) "4096"
265) "zset-max-ziplist-value"
266) "64"
267) "hll-sparse-max-bytes"
268) "3000"
269) "tracking-table-max-keys"
270) "1000000"
271) "client-query-buffer-limit"
272) "1073741824"
273) "repl-backlog-ttl"
274) "3600"
275) "auto-aof-rewrite-min-size"
276) "67108864"
277) "tls-port"
278) "0"
279) "tls-session-cache-size"
280) "20480"
281) "tls-session-cache-timeout"
282) "300"
283) "tls-cluster"
284) "no"
285) "tls-replication"
286) "no"
287) "tls-auth-clients"
288) "yes"
289) "tls-prefer-server-ciphers"
290) "no"
291) "tls-session-caching"
292) "yes"
293) "tls-cert-file"
294) ""
295) "tls-key-file"
296) ""
297) "tls-key-file-pass"
298) ""
299) "tls-client-cert-file"
300) ""
301) "tls-client-key-file"
302) ""
303) "tls-client-key-file-pass"
304) ""
305) "tls-dh-params-file"
306) ""
307) "tls-ca-cert-file"
308) ""
309) "tls-ca-cert-dir"
310) ""
311) "tls-protocols"
312) ""
313) "tls-ciphers"
314) ""
315) "tls-ciphersuites"
316) ""
317) "logfile"
318) ""
319) "watchdog-period"
320) "0"
321) "dir"
322) "/data"
323) "save"
324) "3600 1 300 100 60 10000"
325) "client-output-buffer-limit"
326) "normal 0 0 0 slave 268435456 67108864 60 pubsub 33554432 8388608 60"
327) "unixsocketperm"
328) "0"
329) "slaveof"
330) ""
331) "notify-keyspace-events"
332) ""
333) "bind"
334) ""
335) "oom-score-adj-values"
336) "0 200 800"
</prev> 


## 2. Verificar o parâmetro “appendonly”
Dica: Esse parâmetro configura para salvar todos seus comandos. 

<code> config get appendonly
"</code>

Retorna:

<prev>
1) "appendonly"
2) "yes</prev> 

## 3. Remover a persistência dos dados, alterando o parâmetro “appendonly” para “no”
<code> config set appendonly no
</code>
Retorna:

<prev>OK</prev> 

## 4. Verificar o parâmetro “save”
Dica: 

O save você pode definir por tempo e  quantidade de chave que ele vai 
persistir no seu disco.De tempos em tempo você vai gravando em seu disco, não precisa fazer sempre.

<code>config get save
</code>

Retorna:
<prev>1) "save"
2) "3600 1 300 100 60 10000"</prev> 

## 5. Adicionar a persistência dos dados, para a cada 2 minutos (120 segundos) se pelo menos 500 chaves forem alteradas, adicionando o parâmetro “save” para “120 500”
Dica : O tempo no save, sempre será em segundos e quando houver mais de um parametro precisa está entre chaves.
ou aspas duplas.

<code>config set save '120 500'
</code>

Retorna:
<prev>OK</prev> 

## 6. Verificar os parâmetros “maxmemory*”
<code>config get maxmemory*</code>
Dica: Esse parâmetro lista informações relacionados com a memoria.E o * qualquer um relacionado a ele.

Retorna:

<prev>1) 
"maxmemory-policy" (Mostrar as políticas)

2) "noeviction" 

3) "maxmemory-samples"

4) "5"  Números deamostras são 5)

5) "maxmemory-eviction-tenacity"

6) "10"

7) "maxmemory"

8) "0" (O máximo de memoria NÃO está configurado, está zero.Ou seja ele não está fazendo a persistência de dados  ) 
</prev> 

## 7. Permitir que o Redis remova automaticamente os dados antigos à medida
que você adiciona novos dados,  com uso da politica “allkeys-lru”, quando chegar a 1mb de memória.

Dica isso será feito em dois passos.
1º Passo
<code> config set maxmemory-policy allkeys-lru
</code>
Retorna:
<prev>OK</prev> 

2º Passo
<code>config set maxmemory 1mb
</code>
Retorna:
<prev>OK</prev> 

## 8. Verificar as novas configurações
<code> get maxmemory
</code>

Retorna:
<prev>
1) "maxmemory"
2) "1048576"</prev> 

## Ou tudo relaciondo a memoria.
 <code>  config get maxmemory*
</code>

Retorna:
<prev>
1) "maxmemory-policy"
2) "allkeys-lru"
3) "maxmemory-samples"
4) "5"
5) "maxmemory-eviction-tenacity"
6) "10"
7) "maxmemory"
8) "1048576"</prev> 
