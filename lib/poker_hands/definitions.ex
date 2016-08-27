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
            values_ace_high: "AKQJT98765432",
            values_ace_low:  "KQJT98765432A"
end
