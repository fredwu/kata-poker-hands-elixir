defmodule PokerHands.DealtHand do
  defstruct type: nil,
            cards: [],
            grouped_card_values: []

  alias PokerHands.Card

  @doc """
  ## Examples

      iex> PokerHands.DealtHand.init("2H 4S 2S AH")
      %PokerHands.DealtHand{
        cards: [
          %PokerHands.Card{value: "2", suit: "H", int_value: 2},
          %PokerHands.Card{value: "4", suit: "S", int_value: 4},
          %PokerHands.Card{value: "2", suit: "S", int_value: 2},
          %PokerHands.Card{value: "A", suit: "H", int_value: 14}
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

  defp init_cards(denotation_string) do
    denotation_string
    |> String.split(" ")
    |> Enum.map(&(Card.init(&1)))
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
