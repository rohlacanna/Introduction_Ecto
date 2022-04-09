# 3.4 - Atualização de dados

Para atualizarmos os dados de algum usuário é muito simples!

Vamos utilizar o `Repo.get/2` passando `User` e o `ID` do usuário que queremos atualizar.

```
Repo.get(User, 2)
```

Em seguida, vamos criar um `Changeset` com os campos que queremos fazer a atualização.

```
User.changeset(%{name: "Floki", email: "floki@gato.com", age: 3})
```

Agora, vamos enviar essa atualização para o banco utilizando `Repo.update/1`

```bash
iex(22)> Repo.get(User, 2) |> User.changeset(%{name: "Floki", email: "floki@gato.com", age: 3}) |> Repo.update()

15:57:31.334 [debug] QUERY OK source="users" db=1.9ms idle=1662.5ms
SELECT u0."id", u0."name", u0."email", u0."age" FROM "users" AS u0 WHERE (u0."id" = $1) [2]
{:ok,
 %Ecto4noobs.User{
   __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
   age: 3,
   email: "floki@gato.com",
   id: 2,
   name: "Floki"
 }}
```

Prontinho! Nosso campo `e-mail` foi atualizado com sucesso! :)