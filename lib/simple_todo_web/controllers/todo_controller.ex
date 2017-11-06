defmodule SimpleTodoWeb.TodoController do
  use SimpleTodoWeb, :controller
  alias SimpleTodo.Repo
  import Ecto.Query

  def index(conn, _params) do
    todos = Repo.all(from t in Todo, order_by: t.id)
    render conn, :index, todos: todos
  end
end
