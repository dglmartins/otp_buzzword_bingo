defmodule GameTest do
  use ExUnit.Case
  doctest Bingo.Game

  alias Bingo.Game
  alias Buzzwords.Server

  test "it creates a new Game struct" do
    buzzwords = Server.get_buzzwords()

    game = Game.new(buzzwords, 3)

    assert game.winner == nil
    assert Enum.count(game.squares) == 3
    assert Enum.at(game.squares, 0) |> Enum.count() == 3
  end
end
