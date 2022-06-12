defmodule Gfinancer.Repo.Migrations.CreateDespesas do
  use Ecto.Migration

  def change do
    create table(:despesas) do
      add :descricao, :string
      add :valor, :string

      timestamps()
    end
  end
end
