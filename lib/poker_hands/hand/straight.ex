defmodule PokerHands.Hand.Straight do
  alias PokerHands.Utils

  @ace_high %PokerHands.Definitions{}.values_ace_high
  @ace_low  %PokerHands.Definitions{}.values_ace_low

  @doc """
  ## Examples

      iex> PokerHands.Hand.Straight.valid?(
      iex>   PokerHands.DealtHand.init("2H 3H 4H 5D 6D")
      iex> )
      true

      iex> PokerHands.Hand.Straight.valid?(
      iex>   PokerHands.DealtHand.init("AH 2H 3H 4D 5D")
      iex> )
      true

      iex> PokerHands.Hand.Straight.valid?(
      iex>   PokerHands.DealtHand.init("AH KH QH JD TD")
      iex> )
      true

      iex> PokerHands.Hand.Straight.valid?(
      iex>   PokerHands.DealtHand.init("2H 3C 4H 5D 7D")
      iex> )
      false
  """
  def valid?(dealt_hand) do
    ace_high?(dealt_hand) || ace_low?(dealt_hand)
  end

  defp ace_high?(dealt_hand) do
    dealt_hand |> hand_values() |> matches?(@ace_high)
  end

  defp ace_low?(dealt_hand) do
    dealt_hand |> rotated_hand_values() |> matches?(@ace_low)
  end

  defp matches?(hand_values, all_values) do
    all_values
    |> :binary.match(hand_values)
    |> Kernel.!=(:nomatch)
  end

  defp hand_values(dealt_hand) do
    dealt_hand |> Utils.values() |> Enum.join()
  end

  defp rotated_hand_values(dealt_hand) do
    [head | tail] = Utils.values(dealt_hand)

    Enum.join(tail ++ [head])
  end
end
