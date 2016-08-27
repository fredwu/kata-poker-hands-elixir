defmodule PokerHands.Hand.FourOfAKind do
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
    dealt_hand.grouped_card_values
    |> Kernel.hd()
    |> Kernel.length()
    |> Kernel.==(4)
  end
end
