# HackForChange

Requisitos
Docker e Docker Compose
.NET 6
 
Iniciar o projeto
Clone o repositório.
Navegue até o diretório do projeto.
Executando com Docker Compose
Para iniciar o serviço, incluindo a API e o banco de dados PostgreSQL:

docker-compose up
Isso iniciará os serviços:

A API para cadastro de agendamentos rodando na porta 5000.
Um servidor PostgreSQL.
 
Endpoints:
GET  /api/mentors - listar mentores.
POST /api/mentors  - inserir um mentor. 
GET  /api/mentors/{id} - buscar um mentor por id
PUT  /api/mentors/{id} - Para alterar as informações de um mentor. 
DELETE  /api/mentors/{id} - Para deletar um mentor. 

GET  /api/students - listar estudantes.
POST /api/students  - inserir um estudante. 
GET  /api/students/{id} - buscar um estudante por id
PUT  /api/students/{id} - Para alterar as informações de um estudante. 
DELETE  /api/students/{id} - Para deletar um estudante. 

GET  /api/subjects - listar assuntos/matérias.
POST /api/subjects - Para criar um assunto/matéria. 
GET  /api/subjects/{id} - buscar um assunto/matéria por id.
PUT  /api/subjects/{id} - Para alterar as informações de um assunto/matéria. 
DELETE  /api/subjects/{id} - Para deletar um assunto/matéria. 
POST /api/subjects/associate-mentor - associar assuntos/matérias ao mentor.
POST /api/subjects/associate-student - associar assuntos/matérias(que o aluno têm dificuldade) ao aluno.

GET  /api/schedulings - listar agendamentos
POST /api/schedulings - Para criar um agendamento.
POST /api/schedulings/end - finaliza um agendamento.
GET /api/schedulings/{id} - buscar um agendamento por id.

Sobre o Banco de Dados:
O schema e os índices do banco de dados são definidos no arquivo script.sql. Consulte o arquivo para mais detalhes sobre a estrutura do banco de dados.
