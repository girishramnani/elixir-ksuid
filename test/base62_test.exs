defmodule Base62Test do
    use ExUnit.Case 
    import Base62

    test "encode integers" do
    
        assert encode(0) == "0"
        assert encode(1) == "1"
        assert encode(2) == "2"
        assert encode(3) == "3"
        assert encode(4) == "4"
        assert encode(5) == "5"
        assert encode(6) == "6"
        assert encode(7) == "7"
        assert encode(8) == "8"
        assert encode(9) == "9"
        assert encode(10) == "A"
        assert encode(11) == "B"
        assert encode(12) == "C"
        assert encode(13) == "D"
        assert encode(14) == "E"
        assert encode(15) == "F"
        assert encode(16) == "G"
        assert encode(17) == "H"
        assert encode(18) == "I"
        assert encode(19) == "J"
        assert encode(20) == "K"
        assert encode(21) == "L"
        assert encode(22) == "M"
        assert encode(23) == "N"
        assert encode(24) == "O"
        assert encode(25) == "P"
        assert encode(26) == "Q"
        assert encode(27) == "R"
        assert encode(28) == "S"
        assert encode(29) == "T"
        assert encode(30) == "U"
        assert encode(31) == "V"
        assert encode(32) == "W"
        assert encode(33) == "X"
        assert encode(34) == "Y"
        assert encode(35) == "Z"
        assert encode(36) == "a"
        assert encode(37) == "b"
        assert encode(38) == "c"
        assert encode(39) == "d"
        assert encode(40) == "e"
        assert encode(41) == "f"
        assert encode(42) == "g"
        assert encode(43) == "h"
        assert encode(44) == "i"
        assert encode(45) == "j"
        assert encode(46) == "k"
        assert encode(47) == "l"
        assert encode(48) == "m"
        assert encode(49) == "n"
        assert encode(50) == "o"
        assert encode(51) == "p"
        assert encode(52) == "q"
        assert encode(53) == "r"
        assert encode(54) == "s"
        assert encode(55) == "t"
        assert encode(56) == "u"
        assert encode(57) == "v"
        assert encode(58) == "w"
        assert encode(59) == "x"
        assert encode(60) == "y"
        assert encode(61) == "z"
        assert encode(62) == "10"
        assert encode(100) == "1c"
        assert encode(124) == "20"
        assert encode(4_815_162_342) == "5Frvgk"
        assert encode(9_223_372_036_854_775_807) == "AzL8n0Y58m7"
        assert encode(26_567_849_713_993_370_845_693_800_611_841) == "8zIcpbAKe8shBxXUtl"
    end 

    # output used from ksuid golang base62 implementation
    test "encoding binaries" do
        assert encode("Hello world!") == "T8dgcjRGuYUueWht"
        assert encode("orange") == "YnKg0gM9"
        assert encode("Naruto") == "OTFo3nDT"
        assert encode("The quick brown fox jumps over the lazy dog") == "83UM8dOjD4xrzASgmqLOXTgTagvV1jPegUJ39mcYnwHwTlzpdfKXvpp4RL"
    end

    test "encoded output length is more than original string" do
        input = "microservices"
        encoded_input = encode(input)
        assert String.length(input) < String.length(encoded_input)
    end
    
    test "encode and decode" do
        assert decode!(encode("Hello world!")) == "Hello world!"
        assert decode!(encode("orange")) == "orange"
        assert decode!(encode("Naruto")) == "Naruto"
        assert decode!(encode("The quick brown fox jumps over the lazy dog")) == "The quick brown fox jumps over the lazy dog"
        assert  4_815_162_342 |> encode |> decode! |> bin_to_integer  == 4_815_162_342
        assert  9_223_372_036_854_775_807 |> encode |> decode! |> bin_to_integer  == 9_223_372_036_854_775_807
        assert  26_567_849_713_993_370_845_693_800_611_841 |> encode |> decode! |> bin_to_integer  == 26_567_849_713_993_370_845_693_800_611_841
        assert <<242, 80, 106, 22, 207, 216, 194, 51, 98, 118, 93, 84>> 
        |> encode
        |> decode! == <<242, 80, 106, 22, 207, 216, 194, 51, 98, 118, 93, 84>>

    
    end


end