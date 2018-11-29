defmodule Buzzwords.Server do
  use GenServer

  @name __MODULE__

  @refresh_interval :timer.minutes(60)

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
    schedule_refresh()
    {:ok, load_buzzwords()}
  end

  def handle_call(:get_buzzwords, _from, state) do
    {:reply, state, state}
  end

  def handle_info(:refresh, _state) do
    IO.puts("refreshing")
    state = load_buzzwords()
    schedule_refresh()
    {:noreply, state}
  end

  defp schedule_refresh do
    Process.send_after(self(), :refresh, @refresh_interval)
  end

  # Loads buzzwords from a CSV file, though you could load
  # them from any source, such as an external API.
  defp load_buzzwords() do
    Buzzwords.read_buzzwords()
  end
end
