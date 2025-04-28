defmodule Publisher do
  @moduledoc """
  The fastest publisher in the land.
  """

  @doc """
  ## Examples

      iex> Publisher.publish()
      :ok

  """
  def publish do
    :telemetry.span([:candidate_rmq, :publish], %{start_meta: %{}}, fn ->
      {:ok, %{end_meta: %{}}}
    end)
  end
end
