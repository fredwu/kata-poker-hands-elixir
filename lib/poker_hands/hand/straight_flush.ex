defmodule PokerHands.Hand.StraightFlush do
  alias PokerHands.Hand.{Flush, Straight}

  @doc """
  ## Examples

      iex> PokerHands.Hand.StraightFlush.valid?(
      iex>   PokerHands.DealtHand.init("2H 3H 4H 5H 6H")
      iex> )
      true

      iex> PokerHands.Hand.StraightFlush.valid?(
      iex>   PokerHands.DealtHand.init("AH 2H 3H 4H 5H")
      iex> )
      true

      iex> PokerHands.Hand.StraightFlush.valid?(
      iex>   PokerHands.DealtHand.init("AH KH QH JH TH")
      iex> )
      true

      iex> PokerHands.Hand.StraightFlush.valid?(
      iex>   PokerHands.DealtHand.init("2H 3H 4H 5D 6D")
      iex> )
      false

      iex> PokerHands.Hand.StraightFlush.valid?(
      iex>   PokerHands.DealtHand.init("AH 2H 3H 4H 5D")
      iex> )
      false

      iex> PokerHands.Hand.StraightFlush.valid?(
      iex>   PokerHands.DealtHand.init("AH KH QH JH TD")
      iex> )
      false
  """
  def valid?(dealt_hand) do
    Flush.valid?(dealt_hand) && Straight.valid?(dealt_hand)
  end
end
