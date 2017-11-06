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
end
