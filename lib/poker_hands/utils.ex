defmodule PokerHands.Utils do
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
    dealt_hand.grouped_card_values
    |> Kernel.hd()
    |> Kernel.length()
    |> Kernel.==(size)
  end
end
