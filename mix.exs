defmodule RmqPublisherContest.MixProject do
  use Mix.Project

  def project do
    [
      app: :rmq_publisher_contest,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {RmqPublisherContest.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:telemetry, "~> 1.0"},
      {:amqp, "~> 3.3"},
      {:mimic, "~> 1.10", only: :test}
    ]
  end
end
