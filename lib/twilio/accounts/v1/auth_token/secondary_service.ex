# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Accounts.V1.AuthToken.SecondaryService do
  @moduledoc """
  Secondary Auth Token

  Operations: `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a new secondary Auth Token

  Operation: `CreateSecondaryAuthToken` | Tags: AccountsV1SecondaryAuthToken
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Accounts.V1.AuthToken.Secondary.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/AuthTokens/Secondary",
             opts
             |> Keyword.put_new(:base_url, "https://accounts.twilio.com")
             |> Keyword.put_new(:content_type, :form)
             |> Keyword.put(:params, params)
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Accounts.V1.AuthToken.Secondary)}
    end
  end

  @doc """
  Delete the secondary Auth Token from your account

  Operation: `DeleteSecondaryAuthToken` | Tags: AccountsV1SecondaryAuthToken
  """
  @spec delete(Client.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/AuthTokens/Secondary",
      opts |> Keyword.put_new(:base_url, "https://accounts.twilio.com")
    )
  end
end
