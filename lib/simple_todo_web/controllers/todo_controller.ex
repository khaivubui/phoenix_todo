defmodule SimpleTodoWeb.TodoController do
  use SimpleTodoWeb, :controller

  def index(conn, _params) do
    render conn, :index
  end
end
