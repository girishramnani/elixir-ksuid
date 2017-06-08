defmodule Ksuid do
  @moduledoc """
  KSuid stands for K-Sortable Unique Identifier. It's a way to generate globally unique
  IDs
  """

  @doc """
  Hello world.

  ## Examples

      iex> Ksuid.generate()
      "KZi94b2fnVzpGi60FoZgXIvUtYy"

  """
  @epoch 14000000
  @payload_length  16

  defp get_ts() do
    ts = System.system_time(:second) - @epoch 
    <<ts::integer-size(32)>>  # length of the time stamp is 32 bits
  end  
  
  defp get_bytes() do
    :crypto.strong_rand_bytes(@payload_length)
  end
  
  def generate() do
    kuid_as_bytes = get_ts() <> get_bytes()
    
    kuid_as_bytes 
    |> Base62.encode

  end




end
