defmodule SimpleTodoWeb.TodoController do
  use SimpleTodoWeb, :controller
  alias SimpleTodo.Repo
  import Ecto.Query

  def index conn, _params do
    todos = Repo.all(from t in Todo, order_by: t.id)
    changeset = Todo.changeset %Todo{}

    render conn, :index, todos: todos, changeset: changeset
  end

  def show conn, %{"id" => todo_id} do
    todo = Repo.get Todo, todo_id
    render conn, :show, todo: todo
  end

  def create conn, %{"todo" => todo} do
    todos = Repo.all(from t in Todo, order_by: t.id)

    %Todo{}
    |> Todo.changeset(todo)
    |> Repo.insert()
    |> case do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Todo Created")
        |> redirect(to: todo_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render(:index, todos: todos, changeset: changeset)
    end
  end

  def delete conn, params do

  end
end
