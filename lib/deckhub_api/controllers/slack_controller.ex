defmodule DeckhubApi.SlackController do
  @moduledoc """
  Handles requests coming in from the Hearthstone Slack app.
  """
  use DeckhubApi, :controller

  alias Deckhub.Hearthstone
  alias Deckhub.Hearthstone.Card
  alias Deckhub.Text

  @type command :: keyword()
  @type error :: keyword()
  @type slack_message :: map()

  defmodule BadRequestError do
    defexception plug_status: 400, message: "Bad request"
  end

  @doc """
  Responds to Slack slash commands.
  """
  @spec slash_command(Plug.Conn.t(), map()) :: Plug.Conn.t()
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
  @spec compose_message(command(), Plug.Conn.t()) :: slack_message()
  def compose_message(command, conn)

  def compose_message([card: name], conn) do
    name
    |> Text.to_slug()
    |> Hearthstone.get_card_by_slug_name!()
    |> to_message(conn)
  end

  @doc """
  Converts the given object to the Slack message structure appropriate for that object.
  """
  @spec to_message(Card.t() | error(), Plug.Conn.t()) :: slack_message()
  def to_message(object_or_error, conn)

  def to_message([unrecognized_command: command_text], _conn) do
    %{
      text: "\"#{command_text}\" is not a valid Deckhub command"
    }
  end

  def to_message(%Card{} = card, _conn) do
    %{
      attachments: [
        %{
          fallback: "Hearthstone card: #{card.name}",
          author_name: "Deckhub",
          author_link: "/",
          color: Card.rarity_color(card),
          image_url: card.image,
          mrkdwn_in: ["text"],
          title: card.name,
          title_link: "/",
          text: Text.to_slackmark(card.text),
          ts: get_timestamp()
        }
      ]
    }
  end

  @doc """
  Parses the command from the incoming parameters.
  """
  @spec parse_command(map()) :: command() | no_return()
  def parse_command(params)

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
