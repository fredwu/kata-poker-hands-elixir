defmodule PokerHands do
  alias PokerHands.Comparer

  @doc """
  ## Examples

      iex> PokerHands.vs("2H 3D 5S 9C KD", "2C 3H 4S 8C KH")
      "Left wins!"

      iex> PokerHands.vs("2H 3D 5S 9C KD", "2C 3H 4S 8C AH")
      "Right wins!"

      iex> PokerHands.vs("2H 3D 5S 9C KD", "2D 3H 5C 9S KH")
      "Tie."
  """
  def vs(left, right) do
    left |> Comparer.compare(right) |> format()
  end

  defp format(result) do
    case result do
      :left  -> "Left wins!"
      :right -> "Right wins!"
      :tie   -> "Tie."
    end
  end
end
