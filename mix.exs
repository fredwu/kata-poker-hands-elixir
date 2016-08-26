defmodule PokerHands.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :poker_hands,
      version:         "0.1.0",
      elixir:          "~> 1.3",
      build_embedded:  Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package:         package(),
      deps:            deps(),
      aliases:         ["publish": ["hex.publish", &git_tag/1]]
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end

  defp package do
    [
      maintainers: ["Fred Wu"],
      licenses:    ["MIT"],
      links:       %{"GitHub" => "https://github.com/fredwu/kata-poker-hands-elixir"}
    ]
  end

  defp git_tag(_args) do
    System.cmd "git", ["tag", "v" <> Mix.Project.config[:version]]
  end
end
