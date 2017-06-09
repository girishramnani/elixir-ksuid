defmodule Ksuid do
  @moduledoc """
  KSuid stands for K-Sortable Unique Identifier. It's a way to generate globally unique
  IDs which are partially chronologically sortable.
  """

  
  @epoch 1400000000
  @payload_length  16

  defp get_ts() do
    ts = System.system_time(:second) - @epoch 
    <<ts::integer-size(32)>>  # length of the time stamp is 32 bits
  end  
  
  defp get_bytes() do
    :crypto.strong_rand_bytes(@payload_length)
  end

  @doc """
  This method returns a 20 byte Ksuid which has 4 bytes as timestamp
  and 16 bytes of crypto string bytes.

  ## Examples

      iex> Ksuid.generate()
      "KZi94b2fnVzpGi60FoZgXIvUtYy"

  """
  
  def generate() do
    kuid_as_bytes = get_ts() <> get_bytes()
    
    kuid_as_bytes 
    |> Base62.encode

  end

  def parse(ksuid) when is_binary(ksuid) do
    << ts::32, rand_bytes::bits>> = Base62.decode!(ksuid)
    
    case DateTime.from_unix(ts + @epoch)  do
       {:ok , time } -> {:ok ,time , rand_bytes}
        {:error, reason } -> {:error, reason }
    end
  end




end
