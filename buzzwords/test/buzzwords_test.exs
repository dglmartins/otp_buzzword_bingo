defmodule BuzzwordsTest do
  use ExUnit.Case
  doctest Buzzwords

  test "greets the world" do
    assert Buzzwords.hello() == :world
  end
end
