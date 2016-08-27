defmodule PokerHands.Comparer.HandValue do
  @doc """
  ## Examples

      iex> PokerHands.Comparer.HandValue.compare(100, 80)
      {:left, 100}

      iex> PokerHands.Comparer.HandValue.compare(100, 120)
      {:right, 120}

      iex> PokerHands.Comparer.HandValue.compare(100, 100)
      {:tie, 100}
  """
  def compare(left, right) when left == right, do: {:tie, left}
  def compare(left, right) when left > right,  do: {:left, left}
  def compare(left, right) when left < right,  do: {:right, right}
end
