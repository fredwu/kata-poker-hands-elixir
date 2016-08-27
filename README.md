# PokerHands

Read [requirements](REQUIREMENTS.md) for details about the kata. A ruby version can be found [here](https://github.com/fredwu/kata-poker-hands-ruby).

## Usage

Start the iex console:

```
iex -S mix
```

Use `PokerHands.vs` to compare two hands:

```Elixir
PokerHands.vs("2H 3D 5S 9C KD", "2C 3H 4S 8C KH")
#=> "Left wins!"
```

## License

Licensed under [MIT](http://fredwu.mit-license.org/).
