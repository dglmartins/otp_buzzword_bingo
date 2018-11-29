defmodule Buzzwords.Parser do
  @buzz_path "../../data/buzzwords.csv"

  def read_buzzwords() do
    @buzz_path
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> Flow.from_enumerable()
    |> Flow.map(&trim_split_line/1)
    |> Flow.filter(&filter_empty_line/1)
    |> Flow.map(&array_to_buzzword_map/1)
    |> Enum.to_list()
  end

  defp filter_empty_line(line_string) do
    line_string != [""]
  end

  defp trim_split_line(line_string) do
    line_string
    |> String.trim()
    |> String.split(",")
  end

  defp array_to_buzzword_map([phrase, points_string]) do
    %{phrase: phrase, points: String.to_integer(points_string)}
  end
end
