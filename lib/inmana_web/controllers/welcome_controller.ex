defmodule InmanaWeb.WelcomeController do
  use InmanaWeb, :controller

  alias Inmana.Welcomer

  def index(conn, params) do
    params |> Welcomer.welcome() |> handle_response(conn)
  end

  def handle_response({:ok, msg}, conn) do
    render_response(conn, :ok, msg)
  end

  def handle_response({:error, msg}, conn) do
    render_response(conn, :bad_request, msg)
  end

  def render_response(conn, status, mensage) do
    conn |> put_status(status) |> json(%{mensage: mensage})
  end
end
