defmodule DeckhubWeb.BattleNet.Hearthstone do
  @moduledoc """
  Client for retrieving Hearthstone data from the official Blizzard APIs.

  See [the API reference][hearthstone-api] for more information.

  [heartstone-api]: https://develop.battle.net/documentation/hearthstone
  """

  alias OAuth2.Client, as: OAuthClient
  alias OAuth2.Strategy.ClientCredentials

  @doc """
  Gets an authorized client to use to make Hearthstone API requests.

  ## Examples

  ```
  iex> DeckhubWeb.BattleNet.Hearthstone.get_client()
  %OAuth2.Client{}
  ```
  """
  @spec get_client() :: OAuthClient.t()
  def get_client do
    config()
    |> OAuthClient.new()
    |> OAuthClient.put_serializer("application/json", Jason)
    |> OAuthClient.put_header("accept", "application/json")
    |> OAuthClient.get_token!()
    |> Map.put(:site, api_url())
  end

  defp api_url, do: "https://us.api.blizzard.com"

  defp authorization_url, do: "https://us.battle.net"

  defp config do
    [
      strategy: ClientCredentials,
      client_id: System.get_env("BATTLE_NET_CLIENT_ID"),
      client_secret: System.get_env("BATTLE_NET_CLIENT_SECRET"),
      site: authorization_url()
    ]
  end
end
