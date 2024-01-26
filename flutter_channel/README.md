# flutter_channel

Exemplo de Utilização de Canal de Comunicação entre Flutter e Nativo (Android)

## Project Flutter Version

```bash

    Flutter 3.7.5 • channel stable • https://github.com/flutter/flutter.git
    Framework • revision c07f788888 (11 months ago) • 2023-02-22 17:52:33 -0600
    Engine • revision 0f359063c4
    Tools • Dart 2.19.2 • DevTools 2.20.1

```
## Sobre

Este projeto tem como objetivo demonstrar a utilização de um canal de comunicação entre o Flutter e o Android Nativo.

Em seu desenvolvimento foram feitas as seguintes implementações:
- Chamada ao MethodChannel para execução de uma função nativa
- Chamada ao MethodChannel para execução de uma função nativa passando parâmetros
- Chamata ao EventChannel para execução de uma função nativa que retorna um Stream

### MethodChannel

O MethodChannel é um canal de comunicação que permite a chamada de funções nativas a partir do Flutter.

No exemplo de utilização do MethodChannel, foi criado um serviço que retorna uma string podento ser esta concatenando ou não a um nome para o retorno, caso seja informando um argumento para a função nativa esta irá retornar a string concatenada com o nome informado.

### EventChannel

O EventChannel é um canal de comunicação que permite a chamada de funções nativas que retornam um Stream.

No exemplo de utilização do EventChannel, foi criado um serviço que retorna uma string concatenando um nome para o evento e a data e hora atual.

Foram adicionados 2 eventos para alterar o tipo de retorno do Stream, sendo eles:
- alterarEvento: Altera o tipo do evento entre 1 e 2
- alterarEventoNome 2: Altera o nome do evento para e o tipo do evento entre 1 e 2

O objetivo deste exemplo foi executar o serviço nativo que fica em execução e alterar o tipo de retorno do Stream mantendo a conexão com o serviço.

### BasicMessageChannel

O BasicMessageChannel é um canal de comunicação que permite a chamada de funções nativas que retornam um Stream semelhante a uma função com retorno do tipo Future.

No exemplo de utilização do BasicMessageChannel, foi criado um serviço que retorna uma imagem da pasta assets do android e tudo isto após aguardar 10 segundos programados na função.
