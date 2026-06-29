# Sobre esse ambiente
Ele conta com um arquivo main.pl, onde estará o código em prolog que você quiser rodar
## Docker compose
O docker compose serve para executar o arquivo main e abrir o ambiente de execução dos códigos.
### Comando de inicialização
```
docker run -it --rm -v "${PWD}:/app" -w /app swipl swipl main.pl
```
