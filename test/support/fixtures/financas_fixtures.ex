defmodule Gfinancer.FinancasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gfinancer.Financas` context.
  """

  @doc """
  Generate a despesas.
  """
  def despesas_fixture(attrs \\ %{}) do
    {:ok, despesas} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao",
        valor: "some valor"
      })
      |> Gfinancer.Financas.create_despesas()

    despesas
  end

  @doc """
  Generate a receitas.
  """
  def receitas_fixture(attrs \\ %{}) do
    {:ok, receitas} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao",
        valor: "some valor"
      })
      |> Gfinancer.Financas.create_receitas()

    receitas
  end
end
