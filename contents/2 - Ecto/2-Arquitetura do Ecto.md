# 2.2 - Arquitetura do Ecto

Ecto é composto por 4 módulos principais.

- `Ecto.Repo` - Este módulo permite que a gente acesse nossa base de dados. É com ele que podemos criar, atualizar, deletar recursos e executar querie no banco de dados. Dito isso, é necessário um adaptador específico para o SGBD. Para conectarmos a banco de dados relacionais SQL usamos a biblioteca `Ecto SQL`.

- `Ecto.Schema` - Esté módulo permite que a gente consiga mapear qualquer dados em uma struct Elixir.

- `Ecto.Changeset` - É um módulo que permite normalizar e validar nossos dados da aplicação.

- `Ecto.Query` - Módulo que permite fazer queries no banco de dados através de uma DSL em Elixir de uma forma mais fácil e segura, evitando `SQL Injection`.