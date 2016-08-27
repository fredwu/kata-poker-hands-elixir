defmodule PokerHands.Card do
  defstruct value: "", suit: "", int_value: 0

  @value_mapping %{
    "T" => 10,
    "J" => 11,
    "Q" => 12,
    "K" => 13,
    "A" => 14
  }

  @value_mapping_keys Map.keys(@value_mapping)

  @doc """
  ## Examples

      iex> PokerHands.Card.init("AH")
      %PokerHands.Card{value: "A", suit: "H", int_value: 14}

      iex> PokerHands.Card.init("6S")
      %PokerHands.Card{value: "6", suit: "S", int_value: 6}
  """
  def init(denotation) do
    [value, suit] = String.split(denotation, "", trim: true)

    %__MODULE__{
      value:     value,
      suit:      suit,
      int_value: int_value(value)
    }
  end

  defp int_value(x) when x in @value_mapping_keys, do: @value_mapping[x]
  defp int_value(x),                               do: String.to_integer(x)
end
