defmodule GfinancerWeb.DespesasController do
  use GfinancerWeb, :controller

  alias Gfinancer.Financas
  alias Gfinancer.Financas.Despesas

  def index(conn, _params) do
    despesas = Financas.list_despesas()
    render(conn, "index.html", despesas: despesas)
  end

  def new(conn, _params) do
    changeset = Financas.change_despesas(%Despesas{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"despesas" => despesas_params}) do
    case Financas.create_despesas(despesas_params) do
      {:ok, despesas} ->
        conn
        |> put_flash(:info, "Despesas created successfully.")
        |> redirect(to: Routes.despesas_path(conn, :show, despesas))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    despesas = Financas.get_despesas!(id)
    render(conn, "show.html", despesas: despesas)
  end

  def edit(conn, %{"id" => id}) do
    despesas = Financas.get_despesas!(id)
    changeset = Financas.change_despesas(despesas)
    render(conn, "edit.html", despesas: despesas, changeset: changeset)
  end

  def update(conn, %{"id" => id, "despesas" => despesas_params}) do
    despesas = Financas.get_despesas!(id)

    case Financas.update_despesas(despesas, despesas_params) do
      {:ok, despesas} ->
        conn
        |> put_flash(:info, "Despesas updated successfully.")
        |> redirect(to: Routes.despesas_path(conn, :show, despesas))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", despesas: despesas, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    despesas = Financas.get_despesas!(id)
    {:ok, _despesas} = Financas.delete_despesas(despesas)

    conn
    |> put_flash(:info, "Despesas deleted successfully.")
    |> redirect(to: Routes.despesas_path(conn, :index))
  end
end
