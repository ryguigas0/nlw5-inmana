defmodule Inmana.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Supply

  # Module constant
  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:email, :name]
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "restaurants" do
    field :email, :string
    field :name, :string

    has_many :supplies, Supply

    timestamps()
  end

  # Data casting and validation
  def changeset(restaurant, params \\ %{}) do
    restaurant
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
