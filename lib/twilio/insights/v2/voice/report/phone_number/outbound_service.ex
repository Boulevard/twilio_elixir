# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Insights.V2.Voice.Report.PhoneNumber.OutboundService do
  @moduledoc """
  Outbound Report resource for Voice Insights Phone Numbers Level

  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create Outbound specific Phone Numbers Report for a specific account with given time range.

  Operation: `CreateOutboundPhoneNumbersReport` | Tags: InsightsV1CreateOutboundPhoneNumbersReport
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V2.Voice.Report.PhoneNumber.Outbound.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Voice/Reports/PhoneNumbers/Outbound",
             opts
             |> Keyword.put_new(:base_url, "https://insights.twilio.com")
             |> Keyword.put_new(:content_type, :json)
             |> Keyword.put(:params, params)
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Insights.V2.Voice.Report.PhoneNumber.Outbound
       )}
    end
  end
end
