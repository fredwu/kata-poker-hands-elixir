defmodule PokerHands.Hand.HighCard do
  alias PokerHands.Card

  def valid?(_dealt_hand), do: true

  @doc """
  ## Examples

      iex> PokerHands.Hand.HighCard.high_card_values(
      iex>   PokerHands.DealtHand.init("2D 3H 4C")
      iex> )
      [4, 3, 2]

      iex> PokerHands.Hand.HighCard.high_card_values(
      iex>   PokerHands.DealtHand.init("2D 3H AC")
      iex> )
      [14, 3, 2]
  """
  def high_card_values(dealt_hand) do
    dealt_hand.grouped_card_values
    |> Enum.map(&(Kernel.hd(&1)))
    |> Enum.map(&(Card.int_value(&1)))
  end
end
