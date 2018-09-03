defmodule DeckhubApi.CardView do
  use DeckhubApi, :view

  alias Deckhub.MarkdownEngine
  alias Deckhub.Text

  def render("show.json", %{card: card}) do
    card
    |> Map.from_struct()
    |> Map.drop([:__meta__, :inserted_at, :updated_at])
    |> Map.update!(:text, &Text.to_markdown/1)
    |> Map.update!(:text, &MarkdownEngine.render/1)
  end
end
