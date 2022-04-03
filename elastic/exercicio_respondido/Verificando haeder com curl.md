
#Usando o cliente curl por linha de comando para verificar o cabeçalho

marco@DESKTOP-G2455QH:~/treinamentos/elastic$<code> curl -XHEAD -v http://localhost:9200/cliente/_doc/1 </code>

<prev>
Warning: Setting custom HTTP method to HEAD with -X/--request may not work the
Warning: way you want. Consider using -I/--head instead.
*   Trying 127.0.0.1:9200...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 9200 (#0)
> HEAD /cliente/_doc/1 HTTP/1.1
> Host: localhost:9200
> User-Agent: curl/7.68.0
> Accept: */*
>
* Mark bundle as not supporting multiuse
< HTTP/1.1 404 Not Found
< content-type: application/json; charset=UTF-8
< content-length: 375
<
<prev>

Dica: Ctrl +z para fecha  a sessão