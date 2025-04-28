defmodule PublisherTest do
  use ExUnit.Case
  doctest Publisher

  test "stub publish/0" do
    assert Publisher.publish() == :ok
  end
end
