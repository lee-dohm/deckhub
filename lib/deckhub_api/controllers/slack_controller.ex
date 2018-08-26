defmodule DeckhubApi.SlackController do
  @moduledoc """
  Handles requests coming in from the Hearthstone Slack app.
  """
  use DeckhubApi, :controller

  alias Deckhub.Hearthstone
  alias Deckhub.Text

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
      |> compose_message(conn)

    render(conn, "slash_command.json", %{message: message})
  end

  @doc """
  Composes the [Slack message](https://api.slack.com/docs/messages#composing_messages) for the
  parsed command.
  """
  def compose_message([card: name], conn) do
    name
    |> Text.to_slug()
    |> Hearthstone.get_card!()
    |> to_message(conn)
  end

  def to_message([unrecognized_command: command_text], _conn) do
    %{
      text: "\"#{command_text}\" is not a valid Deckhub command"
    }
  end

  def to_message(%Hearthstone.Card{} = card, conn) do
    %{
      attachments: [
        %{
          fallback: "*Card:* #{card.name}",
          author_name: "Deckhub",
          author_link: page_url(conn, :index),
          image_url: card.image,
          mrkdwn_in: ["text"],
          title: card.name,
          title_link: card_url(conn, :show, card),
          text: Text.to_slackmark(card.text),
          ts: get_timestamp()
        }
      ]
    }
  end

  @doc """
  Parses the command from the incoming parameters.
  """
  def parse_command(%{"text" => "card " <> name}), do: [card: name]

  def parse_command(%{"command" => command, "text" => text}) do
    [unrecognized_command: "#{command} #{text}"]
  end

  def parse_command(_params) do
    raise DeckhubApi.SlackController.BadRequestError
  end

  defp get_timestamp do
    DateTime.to_unix(DateTime.utc_now())
  end
end
