# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V2.Service.OperatorService do
  @moduledoc """
  Service for Operator API operations.

  Operations: `update`, `delete`
  """

  alias Twilio.Client

  @doc """
  Attach an Operator to a Service.

  Operation: `CreateOperatorAttachment` | Tags: IntelligenceV2OperatorAttachment
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/Services/#{service_sid}/Operators/#{sid}",
      opts
      |> Keyword.put_new(:base_url, "https://intelligence.twilio.com")
      |> Keyword.put_new(:content_type, :form)
      |> Keyword.put(:params, params)
    )
  end

  @doc """
  Detach an Operator from a Service.

  Operation: `DeleteOperatorAttachment` | Tags: IntelligenceV2OperatorAttachment
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v2/Services/#{service_sid}/Operators/#{sid}",
      opts |> Keyword.put_new(:base_url, "https://intelligence.twilio.com")
    )
  end
end
