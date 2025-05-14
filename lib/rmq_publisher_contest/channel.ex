defmodule RmqPublisherContest.Channel do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    {:ok, conn} = RmqPublisherContest.Connection.connection()
    {:ok, channel} = AMQP.Channel.open(conn)
    {:ok, %{channel: channel}}
  end

  def handle_call(:get_channel, _from, %{channel: channel} = state) do
    {:reply, channel, state}
  end
end
