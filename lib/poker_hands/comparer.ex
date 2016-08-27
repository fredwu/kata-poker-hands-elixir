defmodule PokerHands.Comparer do
  alias PokerHands.{DealtHand, Comparer.HandType, Comparer.HandValue}

  @doc """
  ## Examples

      iex> PokerHands.Comparer.compare("2H 3D 5S 9C KD", "2C 3H 4S 8C KH")
      :left

      iex> PokerHands.Comparer.compare("2H 3D 5S 9C KD", "2C 3H 4S 8C AH")
      :right

      iex> PokerHands.Comparer.compare("2H 3D 5S 9C KD", "2D 3H 5C 9S KH")
      :tie

  ## Corrected Example (wrong in REQUIREMENTS)

      iex> PokerHands.Comparer.compare("2H 4S 4C 2D 4H", "2S 8S AS QS 3S")
      :left
  """
  def compare(left, right) do
    left_hand       = DealtHand.init(left)
    right_hand      = DealtHand.init(right)

    left_hand_type  = DealtHand.type(left_hand)
    right_hand_type = DealtHand.type(right_hand)

    type_result     = HandType.compare(left_hand_type, right_hand_type)

    with {:tie, type} <- type_result do
      left_hand_values  = type.high_card_values(left_hand)
      right_hand_values = type.high_card_values(right_hand)

      HandValue.compare(left_hand_values, right_hand_values)
    end
  end
end
