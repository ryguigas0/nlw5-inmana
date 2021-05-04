defmodule Inmana.Supplies.Update do
  alias Inmana.{Repo, Supply}

  def call(params) do
    to_update = Repo.get(Supply, params["id"])
    changes = Supply.changeset(to_update, params)
    Repo.update(changes)
  end
end
