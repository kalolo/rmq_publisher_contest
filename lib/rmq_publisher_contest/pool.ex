defmodule RmqPublisherContest.Pool do
  use DynamicSupervisor

  def start_link(_opts) do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def channel_pid do
    DynamicSupervisor.start_child(__MODULE__, {RmqPublisherContest.Channel, []})
  end
end
