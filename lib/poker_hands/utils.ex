defmodule PokerHands.Utils do
  @doc """
  ## Examples

      iex> PokerHands.Utils.values(
      iex>   PokerHands.DealtHand.init("2D 2H 7S 7D AC")
      iex> )
      ["A", "7", "7", "2", "2"]
  """
  def values(dealt_hand) do
    dealt_hand.cards |> Enum.map(&(&1.value))
  end

  @doc """
  ## Examples

      iex> PokerHands.Utils.lead_group_size?(
      iex>   PokerHands.DealtHand.init("2D 2H 7S 7D 2C"), 3
      iex> )
      true

      iex> PokerHands.Utils.lead_group_size?(
      iex>   PokerHands.DealtHand.init("2D 2H 7S 7D 2C"), 4
      iex> )
      false
  """
  def lead_group_size?(dealt_hand, size) do
    group_size(dealt_hand, size, 0)
  end

  @doc """
  ## Examples

      iex> PokerHands.Utils.second_group_size?(
      iex>   PokerHands.DealtHand.init("2D 2H 7S 7D 2C"), 2
      iex> )
      true

      iex> PokerHands.Utils.second_group_size?(
      iex>   PokerHands.DealtHand.init("2D 2H 7S 7D 2C"), 3
      iex> )
      false
  """
  def second_group_size?(dealt_hand, size) do
    group_size(dealt_hand, size, 1)
  end

  defp group_size(dealt_hand, size, group_index) do
    dealt_hand.grouped_card_values
    |> Enum.at(group_index)
    |> Kernel.length()
    |> Kernel.==(size)
  end
end
