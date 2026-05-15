# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Content.V1.Content.ApprovalRequest.WhatsappService do
  @moduledoc """
  Service for Whatsapp API operations.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a ContentApprovalRequest for a content item

  Operation: `CreateApprovalCreate` | Tags: Contentv1ApprovalCreate
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Content.V1.Content.ApprovalRequest.Whatsapp.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, content_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Content/#{content_sid}/ApprovalRequests/whatsapp",
             opts
             |> Keyword.put_new(:base_url, "https://content.twilio.com")
             |> Keyword.put_new(:content_type, :json)
             |> Keyword.put(:params, params)
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Content.V1.Content.ApprovalRequest.Whatsapp
       )}
    end
  end
end
