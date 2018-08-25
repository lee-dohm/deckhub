defmodule DeckhubApi.SlackView do
  use DeckhubApi, :view

  def render(_template, %{message: message}), do: message
end
