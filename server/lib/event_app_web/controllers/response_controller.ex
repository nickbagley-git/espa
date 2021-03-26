defmodule EventAppWeb.ResponseController do
  use EventAppWeb, :controller

  alias EventApp.Responses
  alias EventApp.Responses.Response

  alias EventAppWeb.Plugs
  plug Plugs.RequireAuth when action
    in [:create]

  action_fallback EventAppWeb.FallbackController

  def index(conn, _params) do
    responses = Responses.list_responses()
    render(conn, "index.json", responses: responses)
  end

  def create(conn, %{"response" => response_params}) do
    user = conn.assigns[:current_user]
    response_params = response_params
    |> Map.put("user_id", user.id)
    |> Map.put("event_id", user.id)

    with {:ok, %Response{} = response} <- Responses.create_response(response_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.response_path(conn, :show, response))
      |> render("show.json", response: response)
    end
  end

  def show(conn, %{"id" => id}) do
    response = Responses.get_response!(id)
    render(conn, "show.json", response: response)
  end

  def update(conn, %{"id" => id, "response" => response_params}) do
    response = Responses.get_response!(id)

    with {:ok, %Response{} = response} <- Responses.update_response(response, response_params) do
      render(conn, "show.json", response: response)
    end
  end

  def delete(conn, %{"id" => id}) do
    response = Responses.get_response!(id)

    with {:ok, %Response{}} <- Responses.delete_response(response) do
      send_resp(conn, :no_content, "")
    end
  end
end
