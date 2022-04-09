# 3.3 - Leitura de dados

Após ter feito a nossa escrita no banco, agora podemos também fazer a leitura de todos os dados e é bem simples, basta usarmos `Repo.all/1`.

Vamos testar no iex:

```bash
iex> Repo.all(User)

15:41:33.261 [debug] QUERY OK source="users" db=1.0ms queue=1.1ms idle=1589.9ms
SELECT u0."id", u0."name", u0."email", u0."age" FROM "users" AS u0 []
[
  %Ecto4noobs.User{
    __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
    age: 23,
    email: "romulo@tomate.com",
    id: 1,
    name: "Rômulo"
  }
]
```

Ou, podemos fazer a leitura utilizando o `Repo.get/2`:

```bash
iex(12)> Repo.get(User, 1)

15:42:45.240 [debug] QUERY OK source="users" db=1.0ms queue=1.6ms idle=1568.2ms
SELECT u0."id", u0."name", u0."email", u0."age" FROM "users" AS u0 WHERE (u0."id" = $1) [1]
%Ecto4noobs.User{
  __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
  age: 23,
  email: "romulo@tomate.com",
  id: 1,
  name: "Rômulo"
}
```

O que fizemos além de passar `User` foi passar o `ID` do usuário que queremos listar.

Além das listagens `Repo.all/1` e `Repo.get/2` também é possível fazer a leitura utilizando um filtro.

Para isso vamos dizer ao módulo que queremos requer/utilizar suas macros.

```bash
iex> require Ecto.Query
Ecto.Query
```

E agora vamos utilizar o filtro para buscar somente usuários que possui o nome **Floki** *(Eu inseri outro usuário antes de fazer a listagem com filtro)*.

Voltando para o iex:

```bash
iex> Ecto.Query.where(User, name: "Floki") |> Repo.all()

15:51:10.119 [debug] QUERY OK source="users" db=0.7ms queue=1.4ms idle=1447.6ms
SELECT u0."id", u0."name", u0."email", u0."age" FROM "users" AS u0 WHERE (u0."name" = 'Floki') []
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