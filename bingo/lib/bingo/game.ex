defmodule Bingo.Game do
  alias Bingo.Square

  @enforce_keys [:squares]
  defstruct squares: nil, scores: %{}, winner: nil

  @doc """
  Creates a game with a `size` x `size` collection of squares
  taken randomly from the given list of `buzzwords` where
  each buzzword is of the form `%{phrase: "Upsell", points: 10}`.
  """
  def new(buzzwords, size) do
    squares =
      buzzwords
      |> Enum.shuffle()
      |> Enum.take(size * size)
      |> Enum.map(&Square.from_buzzword(&1))
      |> Enum.chunk_every(size)

    %Bingo.Game{squares: squares}
  end

  @doc """
  Marks the square that has the given `phrase` for the given `player`,
  updates the scores, and checks for a bingo!
  """
  def mark(game, phrase, player) do
    game
    |> update_squares_with_mark(phrase, player)
  end

  defp update_squares_with_mark(game, phrase, player) do
    new_squares =
      game.squares
      |> List.flatten()
      |> Enum.map(&mark_square_having_phrase(&1, phrase, player))
      |> Enum.chunk_every(Enum.count(game.squares))

    %{game | squares: new_squares}
  end

  defp mark_square_having_phrase(%{phrase: phrase} = square, phrase, player) do
    IO.puts("Im here")
    %Square{square | marked_by: player}
  end

  defp mark_square_having_phrase(square, _phrase, _player) do
    IO.puts("No Im here")
    square
  end
end
