defmodule PoloniexApi.Public do
  alias PoloniexApi.Http
  alias PoloniexApi.Response

  def return_ticker do
    Response.process(Http.get("public?command=returnTicker"))
  end
end