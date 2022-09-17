defmodule NtruKem.MixProject do
  use Mix.Project

  @version "0.0.0"

  def project do
    [
      app: :ntrukem,
      version: @version,
      elixir: "~> 1.3",
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make] ++ Mix.compilers(),
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.4", runtime: false}
      # {:ex_doc, "~> 0.18.1", runtime: false},
      # {:excoveralls, ">= 0.0.0 ", only: :test}
    ]
  end

  defp package do
    [
      name: "ntrukem",
      files: ["lib", "c_src", "mix.exs", "README*", "libntru", "Makefile"],
      maintainers: ["Kambei Sapote"],
      licenses: ["GNU GPLv3"]
    ]
  end
end
