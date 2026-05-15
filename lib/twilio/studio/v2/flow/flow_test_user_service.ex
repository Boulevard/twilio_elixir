# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Studio.V2.Flow.FlowTestUserService do
  @moduledoc """
  Test users of a flow

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch flow test users

  Operation: `FetchTestUser` | Tags: StudioV2FlowTestUser
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V2.Flow.FlowTestUser.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Flows/#{sid}/TestUsers",
             opts |> Keyword.put_new(:base_url, "https://studio.twilio.com")
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V2.Flow.FlowTestUser)}
    end
  end

  @doc """
  Update flow test users

  Operation: `UpdateTestUser` | Tags: StudioV2FlowTestUser

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `TestUsers` | array | List of test user identities that can test draft versions of the flow. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V2.Flow.FlowTestUser.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Flows/#{sid}/TestUsers",
             opts
             |> Keyword.put_new(:base_url, "https://studio.twilio.com")
             |> Keyword.put_new(:content_type, :form)
             |> Keyword.put(:params, params)
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V2.Flow.FlowTestUser)}
    end
  end
end
