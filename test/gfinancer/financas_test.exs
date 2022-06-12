defmodule Gfinancer.FinancasTest do
  use Gfinancer.DataCase

  alias Gfinancer.Financas

  describe "despesas" do
    alias Gfinancer.Financas.Despesas

    import Gfinancer.FinancasFixtures

    @invalid_attrs %{descricao: nil, valor: nil}

    test "list_despesas/0 returns all despesas" do
      despesas = despesas_fixture()
      assert Financas.list_despesas() == [despesas]
    end

    test "get_despesas!/1 returns the despesas with given id" do
      despesas = despesas_fixture()
      assert Financas.get_despesas!(despesas.id) == despesas
    end

    test "create_despesas/1 with valid data creates a despesas" do
      valid_attrs = %{descricao: "some descricao", valor: "some valor"}

      assert {:ok, %Despesas{} = despesas} = Financas.create_despesas(valid_attrs)
      assert despesas.descricao == "some descricao"
      assert despesas.valor == "some valor"
    end

    test "create_despesas/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Financas.create_despesas(@invalid_attrs)
    end

    test "update_despesas/2 with valid data updates the despesas" do
      despesas = despesas_fixture()
      update_attrs = %{descricao: "some updated descricao", valor: "some updated valor"}

      assert {:ok, %Despesas{} = despesas} = Financas.update_despesas(despesas, update_attrs)
      assert despesas.descricao == "some updated descricao"
      assert despesas.valor == "some updated valor"
    end

    test "update_despesas/2 with invalid data returns error changeset" do
      despesas = despesas_fixture()
      assert {:error, %Ecto.Changeset{}} = Financas.update_despesas(despesas, @invalid_attrs)
      assert despesas == Financas.get_despesas!(despesas.id)
    end

    test "delete_despesas/1 deletes the despesas" do
      despesas = despesas_fixture()
      assert {:ok, %Despesas{}} = Financas.delete_despesas(despesas)
      assert_raise Ecto.NoResultsError, fn -> Financas.get_despesas!(despesas.id) end
    end

    test "change_despesas/1 returns a despesas changeset" do
      despesas = despesas_fixture()
      assert %Ecto.Changeset{} = Financas.change_despesas(despesas)
    end
  end

  describe "receitas" do
    alias Gfinancer.Financas.Receitas

    import Gfinancer.FinancasFixtures

    @invalid_attrs %{descricao: nil, valor: nil}

    test "list_receitas/0 returns all receitas" do
      receitas = receitas_fixture()
      assert Financas.list_receitas() == [receitas]
    end

    test "get_receitas!/1 returns the receitas with given id" do
      receitas = receitas_fixture()
      assert Financas.get_receitas!(receitas.id) == receitas
    end

    test "create_receitas/1 with valid data creates a receitas" do
      valid_attrs = %{descricao: "some descricao", valor: "some valor"}

      assert {:ok, %Receitas{} = receitas} = Financas.create_receitas(valid_attrs)
      assert receitas.descricao == "some descricao"
      assert receitas.valor == "some valor"
    end

    test "create_receitas/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Financas.create_receitas(@invalid_attrs)
    end

    test "update_receitas/2 with valid data updates the receitas" do
      receitas = receitas_fixture()
      update_attrs = %{descricao: "some updated descricao", valor: "some updated valor"}

      assert {:ok, %Receitas{} = receitas} = Financas.update_receitas(receitas, update_attrs)
      assert receitas.descricao == "some updated descricao"
      assert receitas.valor == "some updated valor"
    end

    test "update_receitas/2 with invalid data returns error changeset" do
      receitas = receitas_fixture()
      assert {:error, %Ecto.Changeset{}} = Financas.update_receitas(receitas, @invalid_attrs)
      assert receitas == Financas.get_receitas!(receitas.id)
    end

    test "delete_receitas/1 deletes the receitas" do
      receitas = receitas_fixture()
      assert {:ok, %Receitas{}} = Financas.delete_receitas(receitas)
      assert_raise Ecto.NoResultsError, fn -> Financas.get_receitas!(receitas.id) end
    end

    test "change_receitas/1 returns a receitas changeset" do
      receitas = receitas_fixture()
      assert %Ecto.Changeset{} = Financas.change_receitas(receitas)
    end
  end
end
