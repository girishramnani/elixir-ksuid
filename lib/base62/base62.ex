defmodule Base62 do


    @chars "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

    defp generate_cache(type) do
         char_list = String.graphemes(@chars)

        case type do
            :encode -> List.to_tuple(char_list)
            :decode -> char_list |> Enum.with_index |> Map.new
        end
    end
  
    def encode(byte_data) when is_bitstring(byte_data) do
        
        list_of_bytes = for << byte::8 <- byte_data >>, do: byte 
        
        list_of_bytes 
        |> Integer.undigits(256) # convert it into an integer
        |> encode # uses the integer version of encode now
    end


    def encode(integer_data) when is_integer(integer_data) do
        cache = generate_cache(:encode)
        
        integer_data 
        |> Integer.digits(62) # get mod 62 numbers into a list
        |> Enum.map(fn (data) -> elem(cache,data) end)
        |> Enum.into("")
    end

    # TODO
    def decode!(string_data) when is_binary(string_data) do
    
    end

    # TODO
    def decode(string_data) when is_binary(string_data) do
        
    end
end