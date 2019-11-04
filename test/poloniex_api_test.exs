defmodule PoloniexApiTest do
  use ExUnit.Case
  doctest PoloniexApi

  test "greets the world" do
    assert PoloniexApi.hello() == :world
  end
end
