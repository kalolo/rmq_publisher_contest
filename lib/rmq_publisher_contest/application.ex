defmodule RmqPublisherContest.Application do
  use Application

  def start(_type, _args) do
    Supervisor.start_link(
      [
        RmqPublisherContest.Connection,
        {DynamicSupervisor, strategy: :one_for_one, name: RmqPublisherContest.Pool}
      ],
      strategy: :one_for_one,
      name: RmqPublisherContest.Supervisor
    )
  end
end
