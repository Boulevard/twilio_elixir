defmodule Twilio.ClientAuthTest do
  # async: false — these tests mutate global application env.
  use ExUnit.Case, async: false

  alias Twilio.Client

  @keys [:account_sid, :auth_token, :api_key_sid, :api_key_secret]

  setup do
    saved = for k <- @keys, into: %{}, do: {k, Application.fetch_env(:twilio_elixir, k)}

    on_exit(fn ->
      for k <- @keys do
        case Map.fetch!(saved, k) do
          {:ok, val} -> Application.put_env(:twilio_elixir, k, val)
          :error -> Application.delete_env(:twilio_elixir, k)
        end
      end
    end)

    :ok
  end

  defp put(key, value), do: Application.put_env(:twilio_elixir, key, value)
  defp clear(key), do: Application.delete_env(:twilio_elixir, key)

  test "uses API Key when configured without an auth token" do
    put(:account_sid, "ACxxx")
    clear(:auth_token)
    put(:api_key_sid, "SKxxx")
    put(:api_key_secret, "secret")

    client = Client.new()

    assert client.username == "SKxxx"
    assert client.password == "secret"
    assert client.auth_token == nil
  end

  test "auth token wins when both token and API key are configured" do
    put(:account_sid, "ACxxx")
    put(:auth_token, "token")
    put(:api_key_sid, "SKxxx")
    put(:api_key_secret, "secret")

    client = Client.new()

    assert client.username == "ACxxx"
    assert client.password == "token"
  end

  test "raises on incomplete API key config" do
    put(:account_sid, "ACxxx")
    clear(:auth_token)
    put(:api_key_sid, "SKxxx")
    clear(:api_key_secret)

    assert_raise RuntimeError, ~r/api_key_sid.*api_key_secret/s, fn -> Client.new() end
  end

  test "raises on incomplete API key config (secret without sid)" do
    put(:account_sid, "ACxxx")
    clear(:auth_token)
    clear(:api_key_sid)
    put(:api_key_secret, "secret")

    assert_raise RuntimeError, ~r/api_key_sid.*api_key_secret/s, fn -> Client.new() end
  end

  test "raises when account_sid is missing" do
    clear(:account_sid)
    clear(:auth_token)
    clear(:api_key_sid)
    clear(:api_key_secret)

    assert_raise RuntimeError, ~r/account_sid/, fn -> Client.new() end
  end
end
