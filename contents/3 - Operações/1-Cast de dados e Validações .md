# 3.1 - Criando cast de dados e validações

O **Changeset** recebe uma struct e com isso ele consegue tanto fazer cast de dados para inserir nessa struct como também fazer validações e modificações. Porém, a função tem que se chamar changeset por default do Ecto.

Ok, mas o que é o cast? A função cast pega os parâmetros e tenta fazer o cast nos campos da struct e como segundo argumento temos que definir uma lista de campos para cast e nosso caso já temos essa lista que é a nossa variável de módulo `@required_params`.

```elixir
defmodule Ecto4noobs.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:age, :email, :name]

  schema "users" do
  ...
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
  end
end
```

Agora vamos no nosso iex criar um mapa `user_params`:

```bash
iex> user_params = %{name: "Rômulo", email: "romulo@tomate.com", age: 23}

%{age: 23, email: "romulo@tomate.com", name: "Rômulo"}
```

E em seguida, vamos criar nosso `Changeset`:

```bash
iex> alias Ecto4noobs.User
Ecto4noobs.User
iex> User.changeset(user_params)
#Ecto.Changeset<
  action: nil,
  changes: %{age: 23, email: "romulo@tomate.com", name: "Rômulo"},
  errors: [],
  data: #Ecto4noobs.User<>,
  valid?: true
>
```

Agora temos um Changeset do Ecto que é uma struct especial que valida os nossos dados, faz cast dos dados e vai ser mandada para o banco.

Dito isso, vamos criar as validações pela função `validate_required` que também recebe uma lista.

```elixir
defmodule Ecto4noobs.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:age, :email, :name]

  schema "users" do
  ...
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
```

Voltando para o nosso iex, vamos remover o name de `user_params` e tentar criar o changeset novamente:

```bash
iex> user_params = %{email: "romulo@tomate.com", age: 23}
%{age: 23, email: "romulo@tomate.com"}
iex> User.changeset(user_params)
#Ecto.Changeset<
  action: nil,
  changes: %{age: 23, email: "romulo@tomate.com"},
  errors: [name: {"can't be blank", [validation: :required]}],
  data: #Ecto4noobs.User<>,
  valid?: false
>
```

Perfeito! Está tudo funcionando, ele nós retorna um `error` dizendo que o campo `name` não pode ser vazio e um `valid?` false!

Com isso, já podemos partir para a inserção de dados.