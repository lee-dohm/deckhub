defmodule DeckhubApi.CardView do
  use DeckhubApi, :view

  def render("show.json", %{card: card}) do
    card
    |> Map.from_struct()
    |> Map.drop([:__meta__, :inserted_at, :updated_at])
  end
end
