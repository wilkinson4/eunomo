defmodule Eunomo.MixProject do
  use Mix.Project

  def project do
    [
      app: :eunomo,
      version: "0.1.0",
      elixir: ">= 1.10.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        plt_add_deps: :transitive,
        plt_add_apps: [:mix],
        plt_file: {:no_warn, "plts/eunomo.plt"}
      ],
      aliases: aliases(),
      package: package()
    ]
  end

  defp package do
    [
      description: "Elixir `alias` and `import` sorter.",
      files: [
        ".eunomo.exs",
        "lib",
        "LICENSE.md",
        "mix.exs",
        "README.md"
      ],
      maintainers: ["A. Roberto Fischer"],
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/Roberto-XY/eunomo"
      }
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.3", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      format!: ["format", "eunomo", "credo --strict"]
    ]
  end
end
