defmodule GfinancerWeb.PageController do
  use GfinancerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
