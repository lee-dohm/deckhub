defmodule DeckhubApi.SlackController do
  @moduledoc """
  Handles requests coming in from the Hearthstone Slack app.
  """
  use DeckhubApi, :controller

  defmodule BadRequestError do
    defexception plug_status: 400, message: "Bad request"
  end

  @doc """
  Responds to Slack slash commands.
  """
  def slash_command(conn, params) do
    message =
      params
      |> parse_command()
      |> compose_message()

    render(conn, "slash_command.json", %{message: message})
  end

  @doc """
  Composes the [Slack message](https://api.slack.com/docs/messages#composing_messages) for the
  parsed command.
  """
  def compose_message(unrecognized_command: command_text) do
    %{
      text: "\"#{command_text}\" is not a valid command"
    }
  end

  @doc """
  Parses the command from the incoming parameters.
  """
  def parse_command(%{"command" => command, "text" => text}) do
    [unrecognized_command: "#{command} #{text}"]
  end

  def parse_command(_params) do
    raise DeckhubApi.SlackController.BadRequestError
  end

  # def parse_command(%{"text" => "card " <> name}), do: [card: name]
end
