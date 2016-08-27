defmodule PokerHands.Comparer.HandType do
  @hands %PokerHands.Definitions{}.hands

  @doc """
  ## Examples

      iex> PokerHands.Comparer.HandType.compare(
      iex>   PokerHands.Hand.Pair,
      iex>   PokerHands.Hand.HighCard
      iex> )
      {:left, PokerHands.Hand.Pair}

      iex> PokerHands.Comparer.HandType.compare(
      iex>   PokerHands.Hand.HighCard,
      iex>   PokerHands.Hand.Pair
      iex> )
      {:right, PokerHands.Hand.Pair}

      iex> PokerHands.Comparer.HandType.compare(
      iex>   PokerHands.Hand.Pair,
      iex>   PokerHands.Hand.Pair
      iex> )
      {:tie, PokerHands.Hand.Pair}
  """
  def compare(left, right) when left == right, do: {:tie, left}
  def compare(left, right) do
    if hand_rank(left) > hand_rank(right) do
      {:right, right}
    else
      {:left, left}
    end
  end

  defp hand_rank(hand) do
    Enum.find_index(@hands, fn(h) -> h == hand end)
  end
end
