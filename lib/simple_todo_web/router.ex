defmodule SimpleTodoWeb.Router do
  use SimpleTodoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SimpleTodoWeb do
    pipe_through :browser # Use the default browser stack
    resources "/", TodoController, except: [:new]
    patch "/:id/toggle_completed", TodoController, :toggle_completed
  end

  # Other scopes may use custom stacks.
  # scope "/api", SimpleTodoWeb do
  #   pipe_through :api
  # end
end
