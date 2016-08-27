defmodule PokerHands.Hand.TwoPairs do
  alias PokerHands.{Hand.HighCard, Utils}

  @doc """
  ## Examples

      iex> PokerHands.Hand.TwoPairs.valid?(
      iex>   PokerHands.DealtHand.init("2D 5H 7S 7D 2C")
      iex> )
      true

      iex> PokerHands.Hand.TwoPairs.valid?(
      iex>   PokerHands.DealtHand.init("2D 5H 6S 7D 2C")
      iex> )
      false
  """
  def valid?(dealt_hand) do
    Utils.lead_group_size?(dealt_hand, 2) &&
      Utils.second_group_size?(dealt_hand, 2)
  end

  @doc """
  ## Examples

      iex> PokerHands.Hand.TwoPairs.high_card_values(
      iex>   PokerHands.DealtHand.init("2D 5H 7S 7D 2C")
      iex> )
      [7, 2, 5]
  """
  defdelegate high_card_values(dealt_hand), to: HighCard
end
