defmodule PokerHands.Hand.Pair do
  alias PokerHands.{Hand.HighCard, Utils}

  @doc """
  ## Examples

      iex> PokerHands.Hand.Pair.valid?(
      iex>   PokerHands.DealtHand.init("2D 5H 6S 7D 2C")
      iex> )
      true

      iex> PokerHands.Hand.Pair.valid?(
      iex>   PokerHands.DealtHand.init("2D 5H 6S 7D 8C")
      iex> )
      false
  """
  def valid?(dealt_hand) do
    Utils.lead_group_size?(dealt_hand, 2)
  end

  @doc """
  ## Examples

      iex> PokerHands.Hand.Pair.high_card_values(
      iex>   PokerHands.DealtHand.init("2D 5H 6S 7D 2C")
      iex> )
      [2, 7, 6, 5]
  """
  defdelegate high_card_values(dealt_hand), to: HighCard
end
