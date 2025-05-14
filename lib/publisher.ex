defmodule Publisher do
  @moduledoc """
  The fastest publisher in the land.
  """

  @doc """
  ## Examples

      iex> Publisher.publish()
      :ok

  """
  def publish() do
    :telemetry.execute([:rmq_publisher, :publish, :start], %{}, %{})

    RmqPublisherContest.Publisher.publish(
      "publisher_test",
      "messages.v1.create",
      "message_payload"
    )

    :telemetry.execute([:rmq_publisher, :publish, :stop], %{}, %{})
  end

end
