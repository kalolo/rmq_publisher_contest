# RmqPublisherContest

Let the contest begin!

We're asking for a brave volunteer to create the speediest RabbitMQ publisher.

Fork this repository to your personal GitHub account and begin building.

Feel free to add any extra telemetry data you'd like, using the prefix `:candidate_rmq`.
Include tests, documentation, and any required configs.
Please try and only spend a few hours on the solution, and if you can time how long the development takes that will be great info to include.
Your solution will be graded on a matrix of payload size and concurrency, and pulled in as a github dependency to the grading framework.
It will be tested on a M1 Macbook Pro and a local RabbitMQ instance.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `rmq_publisher_contest` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:rmq_publisher_contest, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/rmq_publisher_contest>.

