defmodule Gfinancer.Repo.Migrations.CreateReceitas do
  use Ecto.Migration

  def change do
    create table(:receitas) do
      add :descricao, :string
      add :valor, :string

      timestamps()
    end
  end
end
