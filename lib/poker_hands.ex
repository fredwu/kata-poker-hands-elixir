defmodule PokerHands do
  alias PokerHands.Card

  @doc """
  ## Examples

      iex> PokerHands.init("2H 4S AH")
      [
        %PokerHands.Card{value: "2", suit: "H"},
        %PokerHands.Card{value: "4", suit: "S"},
        %PokerHands.Card{value: "A", suit: "H"}
      ]
  """
  def init(denotation_string) do
    denotation_string
    |> String.split(" ")
    |> Enum.map(fn(denotation) -> Card.init(denotation) end)
  end
end
