# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Insights.V1.Voice.SettingService do
  @moduledoc """
  Service for Setting API operations.

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get the Voice Insights Settings.

  Operation: `FetchAccountSettings` | Tags: InsightsV1Setting

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `SubaccountSid` | string | The unique SID identifier of the Subaccount. |
  """
  @spec fetch(Client.t(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V1.Voice.Setting.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Voice/Settings",
             opts |> Keyword.put_new(:base_url, "https://insights.twilio.com")
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Insights.V1.Voice.Setting)}
    end
  end

  @doc """
  Update a specific Voice Insights Setting.

  Operation: `UpdateAccountSettings` | Tags: InsightsV1Setting

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AdvancedFeatures` | boolean | A boolean flag to enable Advanced Features for Voice Insights. |
  | `SubaccountSid` | string | The unique SID identifier of the Subaccount. |
  | `VoiceTrace` | boolean | A boolean flag to enable Voice Trace. |
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V1.Voice.Setting.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Voice/Settings",
             opts
             |> Keyword.put_new(:base_url, "https://insights.twilio.com")
             |> Keyword.put_new(:content_type, :form)
             |> Keyword.put(:params, params)
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Insights.V1.Voice.Setting)}
    end
  end
end
