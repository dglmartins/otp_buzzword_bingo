defmodule Buzzwords.Application do
  def start(_type, _args) do
    IO.puts("Starting the buzzword application...")
    # in separate supervisor
    Buzzwords.Supervisor.start_link()
  end
end
