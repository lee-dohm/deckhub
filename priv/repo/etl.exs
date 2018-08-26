defmodule Deckhub.ETL do
  @moduledoc """
  The Extract/Transform/Load infrastructure for converting data from hearstonejson.com's format
  to our own.
  """
  @headers [
    "Accept": "Application/json; Charset=utf-8"
  ]

  def parse_arguments(argv) do
    OptionParser.parse!(argv, strict: [extract: :boolean])
  end

  def run(options) do
    "https://api.hearthstonejson.com/v1/strings/enUS/GLOBAL.json"
    |> extract("strings", options)
    |> transform_strings()

    "https://api.hearthstonejson.com/v1/latest/enUS/cards.collectible.json"
    |> extract("cards", options)
    |> transform_cards()
  end

  defp add_image_attribute(cards) do
    Enum.map(cards, fn(card) ->
      Map.put(
        card,
        "image",
        "https://art.hearthstonejson.com/v1/render/latest/enUS/512x/#{card["id"]}.png"
      )
    end)
  end

  defp base_path(basename) do
    Path.join(__DIR__, basename)
  end

  defp extract(_url, basename, {[extract: false], _}) do
    path = base_path(basename) <> ".json"

    IO.puts("==> Read #{path}")
    path
    |> File.read!()
    |> Poison.decode!()
  end

  defp extract(url, basename, _options) do
    IO.puts("==> GET #{url}")
    {:ok, %HTTPoison.Response{status_code: 200} = response} =
      HTTPoison.get(url, @headers, follow_redirect: true)

    write!(response.body, base_path(basename), ".json")

    Poison.decode!(response.body)
  end

  defp transform_cards(cards) do
    cards
    |> add_image_attribute()
    |> write!(base_path("cards"), ".exs")
  end

  defp transform_strings(strings) do
    strings
    |> write!(base_path("strings"), ".exs")
  end

  defp write!(content, path, ext) when is_map(content) or is_list(content) do
    content
    |> Kernel.inspect(limit: :infinity, pretty: true, printable_limit: :infinity, width: 0)
    |> write!(path, ext)
  end

  defp write!(content, path, ext) when is_binary(content) do
    full_path = path <> ext

    IO.puts("==> Write #{full_path}")
    :ok = File.write!(path <> ext, content)
  end
end

System.argv()
|> Deckhub.ETL.parse_arguments()
|> Deckhub.ETL.run()
