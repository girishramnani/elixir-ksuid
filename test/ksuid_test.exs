defmodule KsuidTest do
  use ExUnit.Case

  @ksuid_length 27

  test "length of the Ksuid generated" do
    assert byte_size(Ksuid.generate()) == @ksuid_length
  end

  test "parse" do
    {:ok, time, _} = Ksuid.parse("0p9hhVAUpj6tAzYkpPZSAQc6poU")

    assert time == %DateTime{
             calendar: Calendar.ISO,
             day: 9,
             hour: 14,
             microsecond: {0, 0},
             minute: 25,
             month: 6,
             second: 47,
             std_offset: 0,
             time_zone: "Etc/UTC",
             # unix timp stamps are always in UTC
             utc_offset: 0,
             year: 2017,
             zone_abbr: "UTC"
           }
  end

  test "parse max timestamp" do
    encoding =
      Base62.encode(
        <<255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
          255, 255, 255>>
      )

    {:ok, time, data} = Ksuid.parse(encoding)

    assert time == %DateTime{
             calendar: Calendar.ISO,
             day: 19,
             hour: 23,
             microsecond: {0, 0},
             minute: 21,
             month: 6,
             second: 35,
             std_offset: 0,
             time_zone: "Etc/UTC",
             utc_offset: 0,
             year: 2150,
             zone_abbr: "UTC"
           }

    assert data ===
             <<255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255>>
  end

  test "parse larger than max Ksuid" do
    assert match?({:error, _}, Ksuid.parse("zzzzzzzzzzzzzzzzzzzzzzzzzzz"))
  end

  test "parse Nil Ksuid" do
    {:ok, _, data} = Ksuid.parse("000000000000000000000000000")
    assert data == <<0::128>>
  end

  test "parse small Ksuid" do
    {:ok, _, data} = Ksuid.parse("00000000000000000000000000z")
    assert data == <<61::128>>
  end
end
