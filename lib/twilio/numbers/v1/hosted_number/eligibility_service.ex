# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V1.HostedNumber.EligibilityService do
  @moduledoc """
  Service for Eligibility API operations.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create an eligibility check for a number that you want to host in Twilio.

  Operation: `CreateEligibility` | Tags: NumbersV1Eligibility
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V1.HostedNumber.Eligibility.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/HostedNumber/Eligibility",
             opts
             |> Keyword.put_new(:base_url, "https://numbers.twilio.com")
             |> Keyword.put_new(:content_type, :json)
             |> Keyword.put(:params, params)
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Numbers.V1.HostedNumber.Eligibility)}
    end
  end
end
