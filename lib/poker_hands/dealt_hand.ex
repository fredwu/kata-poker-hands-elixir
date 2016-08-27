defmodule PokerHands.DealtHand do
  defstruct type: nil,
            value: 0,
            cards: []

  alias PokerHands.Card

  @doc """
  ## Examples

      iex> PokerHands.DealtHand.init("2H 4S AH")
      %PokerHands.DealtHand{
        cards: [
          %PokerHands.Card{value: "2", suit: "H", int_value: 2},
          %PokerHands.Card{value: "4", suit: "S", int_value: 4},
          %PokerHands.Card{value: "A", suit: "H", int_value: 14}
        ]
      }
  """
  def init(denotation_string) do
    %__MODULE__{
      cards: init_cards(denotation_string)
    }
  end

  defp init_cards(denotation_string) do
    denotation_string
    |> String.split(" ")
    |> Enum.map(&(Card.init(&1)))
  end
end
