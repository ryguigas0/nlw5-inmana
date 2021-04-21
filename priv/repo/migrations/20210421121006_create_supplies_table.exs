defmodule Inmana.Repo.Migrations.CreateSuppliesTable do
  use Ecto.Migration

  def change do
    create table(:supplies) do
      add :expiration_date, :date
      add :description, :string
      add :responsible, :string

      add :restaurant_id, references(:restaurants, type: :binary_id)

      timestamps() # Know when anything was created or has changed
    end
  end
end
