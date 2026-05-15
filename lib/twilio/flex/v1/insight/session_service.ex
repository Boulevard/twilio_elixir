# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Insight.SessionService do
  @moduledoc """
  Service for Session API operations.

  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  To obtain session details for fetching reports and dashboards

  Operation: `CreateInsightsSession` | Tags: FlexV1InsightsSession
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Insight.Session.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Insights/Session",
             opts
             |> Keyword.put_new(:base_url, "https://flex-api.twilio.com")
             |> Keyword.put_new(:content_type, :form)
             |> Keyword.put(:params, params)
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Insight.Session)}
    end
  end
end
