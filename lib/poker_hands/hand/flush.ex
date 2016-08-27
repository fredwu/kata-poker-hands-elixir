defmodule PokerHands.Hand.Flush do
  @doc """
  ## Examples

      iex> PokerHands.Hand.Flush.valid?(
      iex>   PokerHands.DealtHand.init("2H 3H 4H")
      iex> )
      true

      iex> PokerHands.Hand.Flush.valid?(
      iex>   PokerHands.DealtHand.init("2H 3C 4H")
      iex> )
      false
  """
  def valid?(dealt_hand) do
    dealt_hand.cards
    |> Enum.map(&(&1.suit))
    |> Enum.uniq()
    |> Kernel.length()
    |> Kernel.==(1)
  end
end
