# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.PluginService.Plugin.ArchiveService do
  @moduledoc """
  Service for Archive API operations.

  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `UpdatePluginArchive` | Tags: FlexV1PluginArchive
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.PluginService.Plugin.Archive.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/PluginService/Plugins/#{sid}/Archive",
             opts
             |> Keyword.put_new(:base_url, "https://flex-api.twilio.com")
             |> Keyword.put_new(:content_type, :form)
             |> Keyword.put(:params, params)
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.PluginService.Plugin.Archive)}
    end
  end
end
