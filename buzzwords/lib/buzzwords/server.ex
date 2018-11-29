defmodule Buzzwords.Server do
  use GenServer

  @name __MODULE__

  # Client Interface

  def start_link(_arg) do
    IO.puts("Reading and parsing files into Buzzword.Server...")
    GenServer.start_link(__MODULE__, [], name: @name)
  end

  def get_buzzwords() do
    GenServer.call(@name, :get_buzzwords)
  end

  # Server Callbacks

  def init(_state) do
    {:ok, load_buzzwords()}
  end

  def handle_call(:get_buzzwords, _from, state) do
    {:reply, state, state}
  end

  # Loads buzzwords from a CSV file, though you could load
  # them from any source, such as an external API.
  defp load_buzzwords() do
    Buzzwords.read_buzzwords()
  end
end
