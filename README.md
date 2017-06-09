# Ksuid

ksuid is a zero dependency Elixir library for generating and parsing KSUIDs.

Read more about ksuid [here](https://segment.com/blog/a-brief-history-of-the-uuid/)

## How To

```elixir

iex> Ksuid.generate()
"p9kxW1vWavpdq7VSgbv8piY0nr"

iex> Ksuid.parse("p9kxW1vWavpdq7VSgbv8piY0nr")
{
  :ok,
  %DateTime{calendar: Calendar.ISO, day: 9, hour: 14, microsecond: {0, 0},
    minute: 52, month: 6, second: 34, std_offset: 0, time_zone: "Etc/UTC",
    utc_offset: 0, year: 2017, zone_abbr: "UTC"},
  <<166, 90, 80, 117, 89, 88, 196, 168, 113, 163, 157, 217, 224, 51, 151, 227>>
 }

```


## TODO

- [x] Generate KSUID
- [x] Parsing KSUIDS
- [x] Decode BASE62 method
- [x] Write tests
- [ ] Write Documentation

## Installation

```elixir
def deps do
  [{:ksuid, "~> 0.1.0"}]
end
```

## Credit

[Segmentio/ksuid](https://github.com/segmentio/ksuid)
