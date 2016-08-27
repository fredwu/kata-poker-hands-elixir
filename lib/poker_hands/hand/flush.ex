defmodule PokerHands.Hand.Flush do
  @doc """
  ## Examples

      iex> PokerHands.Hand.Flush.valid?(
      iex>   %PokerHands.DealtHand{
      iex>     cards: [
      iex>       %PokerHands.Card{suit: "H"},
      iex>       %PokerHands.Card{suit: "H"},
      iex>       %PokerHands.Card{suit: "H"}
      iex>     ]
      iex>   }
      iex> )
      true

      iex> PokerHands.Hand.Flush.valid?(
      iex>   %PokerHands.DealtHand{
      iex>     cards: [
      iex>       %PokerHands.Card{suit: "H"},
      iex>       %PokerHands.Card{suit: "C"},
      iex>       %PokerHands.Card{suit: "H"}
      iex>     ]
      iex>   }
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
