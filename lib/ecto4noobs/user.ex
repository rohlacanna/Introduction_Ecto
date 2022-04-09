defmodule Ecto4noobs.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:age, :email, :name]

  schema "users" do
    field(:name, :string)
    field(:email, :string)
    field(:age, :integer)
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)

    # |> validate_number(:age, greater_than_or_equal_to: 18)
    # |> validate_format(:email, ~r/@/)
  end
end
