defmodule PokerHands.Comparer.HandValue do
  @doc """
  ## Examples

      iex> PokerHands.Comparer.HandValue.compare([10, 2], [8, 7])
      :left

      iex> PokerHands.Comparer.HandValue.compare([10, 2], [10, 7])
      :right

      iex> PokerHands.Comparer.HandValue.compare([10, 2], [10, 2])
      :tie
  """
  def compare(left, right) do
    left
    |> Enum.zip(right)
    |> Enum.find(fn({l, r}) -> l != r end)
    |> left_or_right()
  end

  defp left_or_right(nil),                             do: :tie
  defp left_or_right({left, right}) when left > right, do: :left
  defp left_or_right({left, right}) when left < right, do: :right
end
