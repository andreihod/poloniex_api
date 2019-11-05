defmodule PoloniexApi.HttpTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias PoloniexApi.Http

  setup_all do
    HTTPoison.start
  end

  test "returns a valid http response" do
    use_cassette "return_ticker" do
      {:ok, response} = Http.get("public?command=returnTicker")
      assert response.request_url == "https://poloniex.com/public?command=returnTicker"
      assert response.status_code == 200
    end
  end
end