defmodule PokerHands do
  alias PokerHands.Card

  @doc """
  ## Examples

      iex> PokerHands.init("2H 4S AH")
      [
        %PokerHands.Card{value: "2", suit: "H", int_value: 2},
        %PokerHands.Card{value: "4", suit: "S", int_value: 4},
        %PokerHands.Card{value: "A", suit: "H", int_value: 14}
      ]
  """
  def init(denotation_string) do
    denotation_string
    |> String.split(" ")
    |> Enum.map(fn(denotation) -> Card.init(denotation) end)
  end
end
