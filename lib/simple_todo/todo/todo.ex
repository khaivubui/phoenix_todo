defmodule Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :description, :string
    field :completed, :boolean, default: false

    timestamps()
  end

  def changeset todo, params \\ %{} do
    todo
      |> cast(params, [:description, :completed])
      |> validate_required([:description])
      |> validate_inclusion(:completed, [true, false])
  end
end
