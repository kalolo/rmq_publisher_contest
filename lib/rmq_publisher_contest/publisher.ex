defmodule RmqPublisherContest.Publisher do
  require Logger
  def publish(exchange, routing_key, payload, opts \\ []) do
    with {:ok, pid} <- RmqPublisherContest.Pool.channel_pid(),
         {:ok, channel} <- amqp_channel(pid) do
      Logger.info("Publishing to #{inspect(channel)} -> #{exchange}.#{routing_key}")
      AMQP.Basic.publish(channel, exchange, routing_key, payload, opts)
      :ok
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  def reconnect do
    RmqPublisherContest.Connection.reconnect()
  end

  defp amqp_channel(pid) do
    {:ok, GenServer.call(pid, :get_channel)}
  end
end
