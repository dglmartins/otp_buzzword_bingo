defmodule Buzzwords.Supervisor do
  def start_link() do
    IO.puts("Starting the buzzword supervisor...")
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      Buzzwords.Server
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
