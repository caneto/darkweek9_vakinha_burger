<p align="center">
    <img src="https://github.com/caneto/darkweek9_vakinha_burger/blob/main/delivery_app/assets/images/logo.png" width="150" alt="Logo App Vakinha Burger"/>
</p>

<h1 align="center">Vakinha Burger</h1>

---

<h2>Tópicos 📋</h2>

   <p>

   - [📖 Sobre](#-sobre)
   - [📱 Preview](#-preview)
   - [📦 Assets](#-assets)
   - [🛠️ Funcionalidades e Tecnologias Estudadas](#%EF%B8%8F-funcionalidades-e-tecnologias-estudadas)
   - [🤯 Desafios e Aprendizados ao longo do caminho](#-desafios-e-aprendizados-ao-longo-do-caminho)
   - [🤔 Como usar](#-como-usar)
   - [💪 Como contribuir](#-como-contribuir)
   - [📝 Licença](#-licença)

   </p>

---

<h2>📖 Sobre</h2>

<p>
    Projeto desenvolvido na Dart Week | 9ª Edição, um evento de lançamento para a <a href="http://academiadoflutter.com.br/">Academia do Flutter (ADF)</a>, do <a href="https://github.com/rodrigorahman">Rodrigo Rahman</a>.<br><br>
    Nesse tempo de Pré-Acesso que obtive por ser um aluno da ADF (desde Outubro/2022), consegui entender com mais facilidade certos conceitos que ainda estavam confusos para mim, como a parte do <a href="https://pub.dev/packages/bloc">BLoC</a>.<br>
    <br>
</p>


---

<h2>📦 Assets</h2>

- UI Design criado para o evento: <a href="https://www.figma.com/file/02eLp1LEMaZNbolCNBSyKA/Delivery-App?node-id=0%3A1">**Vakinha Burger**</a>
---   

<h2>🛠️ Funcionalidades e Tecnologias Estudadas</h2>

- Consulta da API usando o package Dio
- BLoC como Gerenciamento de Estado
- Fluxo de Login e Logout com a aplicação
- Persistência de dados com o SharedPreferences
- Pattern Matching com match
- Extensions
- Slivers
- RefreshToken (módulo extra)
- Providers
- Mixins
- Singleton
- Teste de BLoC (A Fazer)
- Telas: 
  - Splash (tela inicial do app para transição)
  - Home (tela principal do app, lista todos os produtos disponíveis e que serve de fluxo inicial para as demais telas descritas abaixo)
  - Login (onde possui o fluxo de login)
  - Register (onde possui o fluxo de cadastro)
  - ProductDetail (detalhe da página do produto, onde temos mais componentes descritivos a respeito do produto)
  - Order (onde podemos escolher a forma de pagamento e finalizar nosso pedido)
 - Principais packages utilizados.
    - Bloc - 8.11
    - flutter_bloc - 8.1.2
    - provider - 6.0.5
    - dio - 4.0.6
    - equatable - 2.0.5
    - auto_size_text - 3.0.0
    - brasil_fields - 1.12.0
    
    entre outros
</p>

---

<h2>🤯 Desafios e Aprendizados ao longo do caminho</h2>

   <p>
   Como esse foi um "remake" de um Dart Week que já ocorreu (Vakinha Burger 6ª Edição com GetX), obtive um maior aproveitamento de código. Posso dizer com clareza que aprendi muito com o uso de um package para pattern matching, o <a href="https://pub.dev/packages/match">match</a>. O BLoC combinado com esse package e o ensinamento do Rodrigo Rahman, fica extremamente mais simples e divertido de enteder e desenvolver.<br>
 
   Espero estar sempre aprendendo novas tecnologias com o Rahman e a comunidade incrivel de Flutter!
   </p>

---

<h2>🤔 Como usar</h2>

   ```
   É necessário ter o Flutter instalado. Para configurar o ambiente de desenvolvimento na sua máquina:
   https://flutter.dev/docs/get-started/install

   O aplicativo consome os dados do backend desenvolvido pela comunidade ADF chamado json_rest_server:
   https://pub.dev/packages/json_rest_server

   - Clone o repositório:
   $ git clone https://github.com/caneto/darkweek9_vakinha_burger dw9_vakinhar_burger_bloc

   - Entre no diretório:
   $ cd dw9_vakinhar_burger_bloc

   - Instale as dependências:
   $ flutter pub get

   - Instale o json_rest_server
   $ dart pub global activate json_rest_server

   - Crie um diretório do backend utilizando o json_rest_server
   $ json_rest_server create .\backend

   - Entre no diretório:
   $ cd backend

   - Para inicializá-lo, execute o comando:
   $ jrs run

   - Em outro terminal, no diretório raiz do projeto, execute:
   $ flutter run
   ```

---

<h2>💪 Como contribuir</h2>

   ```
   - Gosto bastante de seguir a seguinte Style Guide de Commits 😊:
   https://udacity.github.io/git-styleguide/

   - Dê um fork no projeto 

   - Cria uma nova branch com suas mudanças:
   $ git checkout -b my-feature

   - Salve suas mudanças e faça uma mensagem de commit message sobre suas alterações:
   $ git commit -m "feat: My new feature"

   - Envie suas mudanças:
   $ git push origin my-feature
   ```

---


<h2>📝 Licença</h2>

<p>
   Esse repositório está sobre a Licença GNU General Public License v3.0, e você pode vê-la no arquivo <a href="https://github.com/caneto/darkweek9_vakinha_burger/blob/main/LICENSE">LICENSE</a> para mais detalhes. 😉
</p>


---

   >Esse projeto foi desenvolvido com ❤️ por **[@Carlos Alberto Pinto](https://www.linkedin.com/in/canetorj/)**, com o instrutor **[@Rodrigo Rahman](https://br.linkedin.com/in/rodrigo-rahman)**, no evento #DartWeek da **[Academia do Flutter]**.<br>
   Se isso te ajudou, dê uma ⭐, e contribua, isso irá me ajudar também 😉

---

   <div align="center">

   [![Linkedin Badge](https://img.shields.io/badge/-Carlos%20Alberto-292929?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/canetorj/)](https://www.linkedin.com/in/canetorj/)

   </div>

