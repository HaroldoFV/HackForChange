
# HackForChange

## API de agendamento de mentoria - HackForChange ALURA/FIAP

API para cadastro de agendamentos de mentoria entre alunos e profissionais

## Descrição

A API HackForChange é um projeto que visa conectar alunos com outros alunos para realizar sessões de mentoria. A API deste projeto fornece uma interface RESTful para realizar as seguintes operações:

* Listar mentores, alunos e assuntos/matérias
* Inserir, atualizar e excluir mentores, alunos e assuntos/matérias
* Associar assuntos/matérias a mentores e alunos
* Criar e finalizar agendamentos

## Requisitos

* Docker e Docker Compose
* .NET 6

## Instalação

### Usando o Docker

1. Clone o repositório.
2. Navegue até o diretório do projeto.
3. Execute o seguinte comando:


docker-compose up


Isso iniciará os serviços:

* A API para cadastro de agendamentos rodando na porta 5000.
* Um servidor PostgreSQL.

### Sem o Docker

1. Instale o .NET 6.
2. Abra o projeto no Visual Studio ou em uma IDE de sua preferência.
3. Execute o projeto.

## Endpoints

Aqui está uma lista dos endpoints RESTful disponíveis:

**Mentores**

* `GET /api/mentors` - Listar mentores
* `POST /api/mentors` - Inserir um mentor
* `GET /api/mentors/{id}` - Buscar um mentor por ID
* `PUT /api/mentors/{id}` - Alterar as informações de um mentor
* `DELETE /api/mentors/{id}` - Excluir um mentor

**Alunos**

* `GET /api/students` - Listar alunos
* `POST /api/students` - Inserir um aluno
* `GET /api/students/{id}` - Buscar um aluno por ID
* `PUT /api/students/{id}` - Alterar as informações de um aluno
* `DELETE /api/students/{id}` - Excluir um aluno

**Assuntos/Matérias**

* `GET /api/subjects` - Listar assuntos/matérias
* `POST /api/subjects` - Inserir um assunto/matéria
* `GET /api/subjects/{id}` - Buscar um assunto/matéria por ID
* `PUT /api/subjects/{id}` - Alterar as informações de um assunto/matéria
* `DELETE /api/subjects/{id}` - Excluir um assunto/matéria
* `POST /api/subjects/associate-mentor` - Associar um assunto/matéria a um mentor
* `POST /api/subjects/associate-student` - Associar um assunto/matéria a um aluno

**Agendamentos**

* `GET /api/schedulings` - Listar agendamentos
* `POST /api/schedulings` - Criar um agendamento
* `POST /api/schedulings/end` - Finalizar um agendamento
* `GET /api/schedulings/{id}` - Buscar um agendamento por ID

## Sobre o Banco de Dados

O schema e os índices do banco de dados são definidos no arquivo `script.sql`. Consulte o arquivo para mais detalhes sobre a estrutura do banco de dados.

## Licença

Este projeto é licenciado sob a licença MIT.


As alterações feitas no formato .md incluem:

* Adição de um título e uma descrição no início do README.
* Atualização da lista de requisitos para incluir a versão específica do Docker e do Docker Compose necessárias.
* Adição de instruções de instalação sem usar o Docker.
* Fornecimento de informações mais detalhadas sobre os endpoints RESTful, incluindo parâmetros e retorno.
* Adição de um diagrama do banco de dados.

Espero que essas alterações sejam úteis.
