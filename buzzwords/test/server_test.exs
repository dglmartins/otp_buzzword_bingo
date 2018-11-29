defmodule ServerTest do
  use ExUnit.Case, async: true

  doctest Buzzwords.Server

  alias Buzzwords.Server

  test "getting the cached buzzwords" do
    {:ok, pid} = Server.start_link([])

    buzzwords = Server.get_buzzwords()

    assert %{phrase: _, points: _} = List.first(buzzwords)

    Process.exit(pid, :normal)
  end
end
