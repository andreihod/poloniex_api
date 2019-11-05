defmodule PoloniexApi.Response do

  def process({:ok, %HTTPoison.Response{status_code: status_code, body: body}}) do
    case status_code do
      200 -> {:ok, body}
      _ -> {:error, body[:error]}
    end
  end

  def process({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, reason}  
  end
end

