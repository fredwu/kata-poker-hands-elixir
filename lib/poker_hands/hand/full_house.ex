defmodule PokerHands.Hand.FullHouse do
  alias PokerHands.{Hand.HighCard, Utils}

  @doc """
  ## Examples

      iex> PokerHands.Hand.FullHouse.valid?(
      iex>   PokerHands.DealtHand.init("2D 2H 7S 7D 2C")
      iex> )
      true

      iex> PokerHands.Hand.FullHouse.valid?(
      iex>   PokerHands.DealtHand.init("2D 2H 3S 7D 2C")
      iex> )
      false
  """
  def valid?(dealt_hand) do
    Utils.lead_group_size?(dealt_hand, 3) &&
      Utils.second_group_size?(dealt_hand, 2)
  end

  @doc """
  ## Examples

      iex> PokerHands.Hand.FullHouse.high_card_values(
      iex>   PokerHands.DealtHand.init("2D 2H 7S 7D 2C")
      iex> )
      [2, 7]
  """
  defdelegate high_card_values(dealt_hand), to: HighCard
end
