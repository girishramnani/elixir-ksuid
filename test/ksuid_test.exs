defmodule KsuidTest do
  use ExUnit.Case

  test "parse" do
    {:ok, time, _ } = Ksuid.parse("p9hhVAUpj6tAzYkpPZSAQc6poU")
    assert time == %DateTime{calendar: Calendar.ISO, day: 9, hour: 14, microsecond: {0, 0},
    minute: 25, month: 6, second: 47, std_offset: 0, time_zone: "Etc/UTC",
    utc_offset: 0, year: 2017, zone_abbr: "UTC"} # unix timp stamps are always in UTC

  end

end
