defmodule PokerHands.Hand.ThreeOfAKind do
  alias PokerHands.Utils

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
end
