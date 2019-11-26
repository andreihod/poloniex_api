defmodule PoloniexApi.TradingTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias PoloniexApi.Trading

  ExVCR.Config.filter_request_headers("Key")
  ExVCR.Config.filter_request_headers("Sign")

  setup_all do    
    HTTPoison.start
  end

  test "return_complete_balances/0" do    
    use_cassette "return_complete_balances" do
      {:ok, balances} = Trading.return_complete_balances
      btc_balance = balances[:BTC]
      assert btc_balance["available"] == "0.03204712"
      assert btc_balance["btcValue"] == "0.03204712"
      assert btc_balance["onOrders"] == "0.00000000"
    end    
  end

  test "fails when api_keys are invalid at" do
    use_cassette "return_complete_balances_error" do
      {:error, error_msg} = Trading.return_complete_balances
      assert error_msg == "Invalid API key/secret pair."
    end    
  end
end