defmodule PoloniexApi.Http do
  use HTTPoison.Base

  @endpoint "https://poloniex.com/"

  def process_url(url) do
    @endpoint <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

  def process_request_headers(header) do
    [{"Content-Type", "application/x-www-form-urlencoded"}] ++ header
  end
end