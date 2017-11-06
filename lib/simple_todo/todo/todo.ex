defmodule Todo do
  use Ecto.Schema

  schema "todos" do
    field :description, :string
    field :completed, :boolean, default: false

    timestamps()
  end
end
