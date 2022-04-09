# 3.2 - Escrita de dados

Para fazermos a escrita de dados, vamos utilizar o `Ecto.Repo` que define um repositório e mapeia os dados que temos no elixir e o nosso repositório físico que é o nosso banco de dados.

Vamos ao iex criar nosso mapa com todos os campos preenchidos:

```bash
iex> user_params = %{name: "Rômulo", email: "romulo@tomate.com", age: 23}
%{age: 23, email: "romulo@tomate.com", name: "Rômulo"}
```

Agora vamos criar nosso `Changeset` e em seguida vamos inserir no nosso banco de dados utilizando `Repo.insert/1`:

```bash
iex> alias Ecto4noobs.User
Ecto4noobs.User
iex> alias Ecto4noobs.Repo
Ecto4noobs.Repo
iex> user_params |> User.changeset() |> Repo.insert()

15:36:36.977 [debug] QUERY OK db=4.4ms decode=1.1ms queue=1.9ms idle=1294.1ms
INSERT INTO "users" ("age","email","name") VALUES ($1,$2,$3) RETURNING "id" [23, "romulo@tomate.com", "Rômulo"]
{:ok,
 %Ecto4noobs.User{
   __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
   age: 23,
   email: "romulo@tomate.com",
   id: 1,
   name: "Rômulo"
 }}
```