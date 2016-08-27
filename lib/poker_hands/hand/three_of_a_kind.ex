defmodule PokerHands.Hand.ThreeOfAKind do
  alias PokerHands.{Hand.HighCard, Utils}

  @doc """
  ## Examples

      iex> PokerHands.Hand.ThreeOfAKind.valid?(
      iex>   PokerHands.DealtHand.init("2D 2H 6S 7D 2C")
      iex> )
      true

      iex> PokerHands.Hand.ThreeOfAKind.valid?(
      iex>   PokerHands.DealtHand.init("2D 5H 6S 7D 8C")
      iex> )
      false
  """
  def valid?(dealt_hand) do
    Utils.lead_group_size?(dealt_hand, 3)
  end

  @doc """
  ## Examples

      iex> PokerHands.Hand.ThreeOfAKind.high_card_values(
      iex>   PokerHands.DealtHand.init("9D 9H 6S KD 9C")
      iex> )
      [9, 13, 6]

      iex> PokerHands.Hand.ThreeOfAKind.high_card_values(
      iex>   PokerHands.DealtHand.init("2D 2H AS KD 2C")
      iex> )
      [2, 14, 13]
  """
  defdelegate high_card_values(dealt_hand), to: HighCard
end
