defmodule PokerHands.Definitions do
  defstruct hands: [
              PokerHands.Hand.StraightFlush,
              PokerHands.Hand.FourOfAKind,
              PokerHands.Hand.FullHouse,
              PokerHands.Hand.Flush,
              PokerHands.Hand.Straight,
              PokerHands.Hand.ThreeOfAKind,
              PokerHands.Hand.TwoPairs,
              PokerHands.Hand.Pair,
              PokerHands.Hand.HighCard
            ],
            values_ace_high: ~w(A K Q J T 9 8 7 6 5 4 3 2),
            values_ace_low:  ~w(K Q J T 9 8 7 6 5 4 3 2 A)
end
