defmodule PokerHands.Hand.FullHouse do
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
    [three_of_a_kind | remaining] = dealt_hand.grouped_card_values
    [pair | _remaining]           = remaining

    Kernel.length(three_of_a_kind) == 3 && Kernel.length(pair) == 2
  end
end
