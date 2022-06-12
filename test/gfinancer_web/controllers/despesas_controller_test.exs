defmodule GfinancerWeb.DespesasControllerTest do
  use GfinancerWeb.ConnCase

  import Gfinancer.FinancasFixtures

  @create_attrs %{descricao: "some descricao", valor: "some valor"}
  @update_attrs %{descricao: "some updated descricao", valor: "some updated valor"}
  @invalid_attrs %{descricao: nil, valor: nil}

  describe "index" do
    test "lists all despesas", %{conn: conn} do
      conn = get(conn, Routes.despesas_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Despesas"
    end
  end

  describe "new despesas" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.despesas_path(conn, :new))
      assert html_response(conn, 200) =~ "New Despesas"
    end
  end

  describe "create despesas" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.despesas_path(conn, :create), despesas: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.despesas_path(conn, :show, id)

      conn = get(conn, Routes.despesas_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Despesas"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.despesas_path(conn, :create), despesas: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Despesas"
    end
  end

  describe "edit despesas" do
    setup [:create_despesas]

    test "renders form for editing chosen despesas", %{conn: conn, despesas: despesas} do
      conn = get(conn, Routes.despesas_path(conn, :edit, despesas))
      assert html_response(conn, 200) =~ "Edit Despesas"
    end
  end

  describe "update despesas" do
    setup [:create_despesas]

    test "redirects when data is valid", %{conn: conn, despesas: despesas} do
      conn = put(conn, Routes.despesas_path(conn, :update, despesas), despesas: @update_attrs)
      assert redirected_to(conn) == Routes.despesas_path(conn, :show, despesas)

      conn = get(conn, Routes.despesas_path(conn, :show, despesas))
      assert html_response(conn, 200) =~ "some updated descricao"
    end

    test "renders errors when data is invalid", %{conn: conn, despesas: despesas} do
      conn = put(conn, Routes.despesas_path(conn, :update, despesas), despesas: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Despesas"
    end
  end

  describe "delete despesas" do
    setup [:create_despesas]

    test "deletes chosen despesas", %{conn: conn, despesas: despesas} do
      conn = delete(conn, Routes.despesas_path(conn, :delete, despesas))
      assert redirected_to(conn) == Routes.despesas_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.despesas_path(conn, :show, despesas))
      end
    end
  end

  defp create_despesas(_) do
    despesas = despesas_fixture()
    %{despesas: despesas}
  end
end
