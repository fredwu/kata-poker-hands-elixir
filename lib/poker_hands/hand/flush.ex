defmodule PokerHands.Hand.Flush do
  alias PokerHands.Hand.HighCard

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

  @doc """
  ## Examples

      iex> PokerHands.Hand.Flush.high_card_values(
      iex>   PokerHands.DealtHand.init("2H 3H 4H")
      iex> )
      [4, 3, 2]

      iex> PokerHands.Hand.Flush.high_card_values(
      iex>   PokerHands.DealtHand.init("2H 3H AH")
      iex> )
      [14, 3, 2]
  """
  defdelegate high_card_values(dealt_hand), to: HighCard
end
