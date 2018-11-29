defmodule Buzzwords do
  alias Buzzwords.Parser

  defdelegate read_buzzwords(), to: Parser
end
