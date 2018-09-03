defmodule DeckhubApi.TermView do
  use DeckhubApi, :view

  def render("show.json", %{term: term}) do
    %{
      "key" => term.key,
      "value" => term.value.html
    }
  end
end
