defmodule Ksuid.Mixfile do
  use Mix.Project

  def project do
    [app: :ksuid,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     deps: deps()]
  end

  def description do
    """
    ksuid is a zero dependency Elixir library for generating KSUIDs. 
    """
  end

  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  defp deps do
  end

  defp package do
    [
     name: :ksuid,
     files: ["lib", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["Girish Ramnani"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/girishramnani/elixir-ksuid" }
    ]
  end
end
