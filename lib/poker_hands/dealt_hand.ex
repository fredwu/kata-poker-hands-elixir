defmodule PokerHands.DealtHand do
  defstruct cards: [],
            grouped_card_values: []

  alias PokerHands.Card

  @doc """
  ## Examples

      iex> PokerHands.DealtHand.init("2H 4S 2S AH")
      %PokerHands.DealtHand{
        cards: [
          %PokerHands.Card{value: "A", suit: "H", int_value: 14},
          %PokerHands.Card{value: "4", suit: "S", int_value: 4},
          %PokerHands.Card{value: "2", suit: "S", int_value: 2},
          %PokerHands.Card{value: "2", suit: "H", int_value: 2}
        ],
        grouped_card_values: [["2", "2"], ["A"], ["4"]]
      }
  """
  def init(denotation_string) do
    cards = init_cards(denotation_string)

    %__MODULE__{
      cards:               cards,
      grouped_card_values: group_card_values(cards)
    }
  end

  @doc """
  ## Examples

      iex> PokerHands.DealtHand.type(
      iex>   PokerHands.DealtHand.init("2H 4S TS AH 6D")
      iex> )
      PokerHands.Hand.HighCard

      iex> PokerHands.DealtHand.type(
      iex>   PokerHands.DealtHand.init("2H 4S 2S AH 6D")
      iex> )
      PokerHands.Hand.Pair

      iex> PokerHands.DealtHand.type(
      iex>   PokerHands.DealtHand.init("2H 4S 2S AH 4D")
      iex> )
      PokerHands.Hand.TwoPairs

      iex> PokerHands.DealtHand.type(
      iex>   PokerHands.DealtHand.init("2H 4S 2S AH 2D")
      iex> )
      PokerHands.Hand.ThreeOfAKind

      iex> PokerHands.DealtHand.type(
      iex>   PokerHands.DealtHand.init("2H 4S 3S 5H 6D")
      iex> )
      PokerHands.Hand.Straight

      iex> PokerHands.DealtHand.type(
      iex>   PokerHands.DealtHand.init("JH 4H QH 5H TH")
      iex> )
      PokerHands.Hand.Flush

      iex> PokerHands.DealtHand.type(
      iex>   PokerHands.DealtHand.init("3H 2D 3D 3C 2S")
      iex> )
      PokerHands.Hand.FullHouse

      iex> PokerHands.DealtHand.type(
      iex>   PokerHands.DealtHand.init("2H 4S 2S 2H 2D")
      iex> )
      PokerHands.Hand.FourOfAKind

      iex> PokerHands.DealtHand.type(
      iex>   PokerHands.DealtHand.init("2H 4H 3H 5H 6H")
      iex> )
      PokerHands.Hand.StraightFlush
  """
  def type(dealt_hand) do
    Enum.find(
      %PokerHands.Definitions{}.hands,
      &(&1.valid?(dealt_hand))
    )
  end

  defp init_cards(denotation_string) do
    denotation_string
    |> String.split(" ")
    |> Enum.map(&(Card.init(&1)))
    |> Enum.sort_by(&(&1.int_value))
    |> Enum.reverse()
  end

  defp group_card_values(cards) do
    cards
    |> Enum.group_by(&(&1.int_value))
    |> Enum.sort_by(fn({int_value, _items}) -> int_value end)
    |> Enum.sort_by(fn({_int_value, items}) -> Kernel.length(items) end)
    |> Enum.reverse()
    |> Enum.map(fn({_int_value, items}) -> Enum.map(items, &(&1.value)) end)
  end
end
