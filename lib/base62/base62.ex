defmodule Base62 do
  @chars "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" |> String.graphemes()

  @decode_chars @chars |> Enum.with_index() |> Map.new()
  @encode_chars @chars |> List.to_tuple()

  def bin_to_integer(bin) do
    list_of_bytes = for <<byte::8 <- bin>>, do: byte

    list_of_bytes
    |> Integer.undigits(256)
  end

  def encode(byte_data) when is_bitstring(byte_data) do
    byte_data
    # convert it into an integer
    |> bin_to_integer
    # uses the integer version of encode now
    |> encode
  end

  def encode(integer_data) when is_integer(integer_data) do
    cache = @encode_chars

    integer_data
    # get mod 62 numbers into a list
    |> Integer.digits(62)
    |> Enum.map(fn data -> elem(cache, data) end)
    |> Enum.into("")
  end

  def decode!(string_data) when is_binary(string_data) do
    cache = @decode_chars

    string_data
    |> String.graphemes()
    |> Enum.map(fn char -> cache[char] end)
    |> Integer.undigits(62)
    |> Integer.digits(256)
    |> Enum.reduce(<<>>, fn number, acc -> acc <> <<number>> end)
  end
end
