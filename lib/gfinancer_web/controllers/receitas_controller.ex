defmodule GfinancerWeb.ReceitasController do
  use GfinancerWeb, :controller

  alias Gfinancer.Financas
  alias Gfinancer.Financas.Receitas

  def index(conn, _params) do
    receitas = Financas.list_receitas()
    render(conn, "index.html", receitas: receitas)
  end

  def new(conn, _params) do
    changeset = Financas.change_receitas(%Receitas{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"receitas" => receitas_params}) do
    case Financas.create_receitas(receitas_params) do
      {:ok, receitas} ->
        conn
        |> put_flash(:info, "Receitas created successfully.")
        |> redirect(to: Routes.receitas_path(conn, :show, receitas))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    receitas = Financas.get_receitas!(id)
    render(conn, "show.html", receitas: receitas)
  end

  def edit(conn, %{"id" => id}) do
    receitas = Financas.get_receitas!(id)
    changeset = Financas.change_receitas(receitas)
    render(conn, "edit.html", receitas: receitas, changeset: changeset)
  end

  def update(conn, %{"id" => id, "receitas" => receitas_params}) do
    receitas = Financas.get_receitas!(id)

    case Financas.update_receitas(receitas, receitas_params) do
      {:ok, receitas} ->
        conn
        |> put_flash(:info, "Receitas updated successfully.")
        |> redirect(to: Routes.receitas_path(conn, :show, receitas))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", receitas: receitas, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    receitas = Financas.get_receitas!(id)
    {:ok, _receitas} = Financas.delete_receitas(receitas)

    conn
    |> put_flash(:info, "Receitas deleted successfully.")
    |> redirect(to: Routes.receitas_path(conn, :index))
  end
end
