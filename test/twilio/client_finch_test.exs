defmodule Twilio.ClientFinchTest do
  use ExUnit.Case, async: true

  alias Twilio.Client

  setup do
    bypass = Bypass.open()
    client = Client.new("ACtest123", "test_token")

    {:ok, bypass: bypass, client: client, base_url: "http://localhost:#{bypass.port}"}
  end

  test "sends the request through Finch", %{bypass: bypass, client: client, base_url: base_url} do
    Bypass.expect_once(bypass, "GET", "/test.json", fn conn ->
      Plug.Conn.resp(conn, 200, ~s({"sid": "SM123"}))
    end)

    assert {:ok, %{"sid" => "SM123"}} =
             Client.request(client, :get, "/test.json", base_url: base_url)
  end

  test "retries connection errors", %{bypass: bypass, client: client, base_url: base_url} do
    test_pid = self()
    handler_id = "client-finch-test-#{inspect(test_pid)}"

    :telemetry.attach(
      handler_id,
      [:twilio, :request, :retry],
      fn _event, _measurements, metadata, _ ->
        if self() == test_pid, do: send(test_pid, {:retry, metadata})
      end,
      nil
    )

    on_exit(fn -> :telemetry.detach(handler_id) end)

    Bypass.down(bypass)

    assert {:error, %Twilio.Error{type: :connection_error}} =
             Client.request(%{client | max_retries: 2}, :get, "/test.json", base_url: base_url)

    assert_received {:retry, %{attempt: 1, reason: :connection_error}}
    assert_received {:retry, %{attempt: 2, reason: :connection_error}}
  end
end
