defmodule ParserTest do
  use ExUnit.Case

  doctest Buzzwords.Parser

  alias Buzzwords.Parser

  test "parses from file" do
    buzzwords = Parser.read_buzzwords()

    assert %{phrase: _, points: _} = List.first(buzzwords)
  end
end
