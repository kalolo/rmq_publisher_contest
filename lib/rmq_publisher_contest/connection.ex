defmodule RmqPublisherContest.Connection do
  use GenServer
  require Logger

  @reconnect_delay 5_000

  @spec start_link(keyword()) :: GenServer.on_start()
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @spec connection() :: {:ok, AMQP.Connection.t()} | {:error, any()}
  def connection do
    GenServer.call(__MODULE__, :get_connection)
  end

  @spec reconnect() :: :ok
  def reconnect do
    GenServer.cast(__MODULE__, :reconnect)
  end

  def init(:ok) do
    {:ok, connect()}
  end

  def handle_call(:get_connection, _from, %{conn: conn} = state) do
    {:reply, {:ok, conn}, state}
  end

  def handle_cast(:reconnect, _state) do
    {:noreply, connect()}
  end

  defp connect do
    # TODO: move rmq url to config...
    case AMQP.Connection.open("amqp://guest:guest@localhost:5672") do
      {:ok, conn} ->
        Logger.info("RmqPublisher connected to RabbitMQ")
        %{conn: conn}

      {:error, reason} ->
        Logger.error("RmqPublisher failed to connect: #{inspect(reason)}")
        :timer.sleep(@reconnect_delay)
        connect()
    end
  end
end
