# 3.5 - Remoção de dados

Se você achou fácil atualizar os dados, verá que para remover é muito mais simples!

Para remover um usuário, vamos utilizar o `Repo.get/2` passando `User` e o `ID` do usuário que queremos deletar.

```
Repo.get(User, 1)
```

E por fim, vamos enviar nossa remoção para o banco utilizando `Repo.delete/1`

```bash
iex(24)> Repo.get(User, 1) |> Repo.delete()

16:02:34.110 [debug] QUERY OK source="users" db=1.9ms queue=0.1ms idle=1438.4ms
SELECT u0."id", u0."name", u0."email", u0."age" FROM "users" AS u0 WHERE (u0."id" = $1) [1]

16:02:34.114 [debug] QUERY OK db=2.6ms queue=1.1ms idle=1440.6ms
DELETE FROM "users" WHERE "id" = $1 [1]
{:ok,
 %Ecto4noobs.User{
   __meta__: #Ecto.Schema.Metadata<:deleted, "users">,
   age: 23,
   email: "romulo@tomate.com",
   id: 1,
   name: "Rômulo"
 }}
```

Para conferir, vamos fazer a leitura de todos os dados:

```bash
iex(25)> Repo.all(User)

16:03:08.243 [debug] QUERY OK source="users" db=1.2ms idle=1572.6ms
SELECT u0."id", u0."name", u0."email", u0."age" FROM "users" AS u0 []
[
  %Ecto4noobs.User{
    __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
    age: 3,
    email: "floki@gato.com",
    id: 2,
    name: "Floki"
  }
]
```

E é isso! Ficou apenas o usuário **Floki** :)