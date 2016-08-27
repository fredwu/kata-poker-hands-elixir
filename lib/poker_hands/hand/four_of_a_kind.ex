defmodule PokerHands.Hand.FourOfAKind do
  alias PokerHands.Utils

  @doc """
  ## Examples

      iex> PokerHands.Hand.FourOfAKind.valid?(
      iex>   PokerHands.DealtHand.init("2D 2H 2S 7D 2C")
      iex> )
      true

      iex> PokerHands.Hand.FourOfAKind.valid?(
      iex>   PokerHands.DealtHand.init("2D 2H 3S 7D 2C")
      iex> )
      false
  """
  def valid?(dealt_hand) do
    Utils.lead_group_size?(dealt_hand, 4)
  end
end
