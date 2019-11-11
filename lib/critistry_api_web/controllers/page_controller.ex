defmodule CritistryApiWeb.PageController do
  use CritistryApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
