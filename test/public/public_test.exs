defmodule PoloniexApi.PublicTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias PoloniexApi.Public

  setup_all do
    HTTPoison.start
  end

  test "return_ticker/0" do
    use_cassette "return_ticker" do
      {:ok, ticker} = Public.return_ticker
      assert ticker[:USDT_BTC]
      assert ticker[:USDT_ETH]
      assert ticker[:USDT_LTC]
    end    
  end
end