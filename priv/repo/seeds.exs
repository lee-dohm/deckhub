# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Deckhub.Repo.insert!(%Deckhub.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Deckhub.Hearthstone

{cards, _} = Code.eval_file(Path.join(__DIR__, "cards.exs"))

Enum.each(cards, fn(map) ->
  {:ok, _} = Hearthstone.create_card(map)
end)
