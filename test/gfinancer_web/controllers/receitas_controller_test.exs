defmodule GfinancerWeb.ReceitasControllerTest do
  use GfinancerWeb.ConnCase

  import Gfinancer.FinancasFixtures

  @create_attrs %{descricao: "some descricao", valor: "some valor"}
  @update_attrs %{descricao: "some updated descricao", valor: "some updated valor"}
  @invalid_attrs %{descricao: nil, valor: nil}

  describe "index" do
    test "lists all receitas", %{conn: conn} do
      conn = get(conn, Routes.receitas_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Receitas"
    end
  end

  describe "new receitas" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.receitas_path(conn, :new))
      assert html_response(conn, 200) =~ "New Receitas"
    end
  end

  describe "create receitas" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.receitas_path(conn, :create), receitas: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.receitas_path(conn, :show, id)

      conn = get(conn, Routes.receitas_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Receitas"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.receitas_path(conn, :create), receitas: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Receitas"
    end
  end

  describe "edit receitas" do
    setup [:create_receitas]

    test "renders form for editing chosen receitas", %{conn: conn, receitas: receitas} do
      conn = get(conn, Routes.receitas_path(conn, :edit, receitas))
      assert html_response(conn, 200) =~ "Edit Receitas"
    end
  end

  describe "update receitas" do
    setup [:create_receitas]

    test "redirects when data is valid", %{conn: conn, receitas: receitas} do
      conn = put(conn, Routes.receitas_path(conn, :update, receitas), receitas: @update_attrs)
      assert redirected_to(conn) == Routes.receitas_path(conn, :show, receitas)

      conn = get(conn, Routes.receitas_path(conn, :show, receitas))
      assert html_response(conn, 200) =~ "some updated descricao"
    end

    test "renders errors when data is invalid", %{conn: conn, receitas: receitas} do
      conn = put(conn, Routes.receitas_path(conn, :update, receitas), receitas: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Receitas"
    end
  end

  describe "delete receitas" do
    setup [:create_receitas]

    test "deletes chosen receitas", %{conn: conn, receitas: receitas} do
      conn = delete(conn, Routes.receitas_path(conn, :delete, receitas))
      assert redirected_to(conn) == Routes.receitas_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.receitas_path(conn, :show, receitas))
      end
    end
  end

  defp create_receitas(_) do
    receitas = receitas_fixture()
    %{receitas: receitas}
  end
end
