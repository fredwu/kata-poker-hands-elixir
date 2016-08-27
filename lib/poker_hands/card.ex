defmodule PokerHands.Card do
  defstruct value: "", suit: ""

  @doc """
  ## Examples

      iex> PokerHands.Card.init("AH")
      %PokerHands.Card{value: "A", suit: "H"}

      iex> PokerHands.Card.init("6S")
      %PokerHands.Card{value: "6", suit: "S"}
  """
  def init(denotation) do
    [value, suit] = String.split(denotation, "", trim: true)

    %__MODULE__{value: value, suit: suit}
  end
end
