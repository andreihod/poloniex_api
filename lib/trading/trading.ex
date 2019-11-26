defmodule PoloniexApi.Trading do
  alias PoloniexApi.Http
  alias PoloniexApi.Response

  def return_complete_balances do
    body = prepare_body("command=returnCompleteBalances")
    Response.process(Http.post("tradingApi", body, prepare_header(body)))
  end

  defp prepare_body(body) do
    nonce = :os.system_time(:millisecond)
    body <> "&nonce=#{nonce}"
  end

  defp prepare_header(body) do
    key = Application.fetch_env!(:poloniex_api, :api_key)
    secret = Application.fetch_env!(:poloniex_api, :api_secret)
    sign = Base.encode16(:crypto.hmac(:sha512, secret, body))

    [{"Key", key},{"Sign", sign}]
  end
end