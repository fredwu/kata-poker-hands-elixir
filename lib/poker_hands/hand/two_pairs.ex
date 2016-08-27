defmodule PokerHands.Hand.TwoPairs do
  alias PokerHands.Utils

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
end
