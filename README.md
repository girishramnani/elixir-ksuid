# Ksuid

ksuid is a zero dependency Elixir library for generating KSUIDs.
 
Read more about ksuid [here](https://segment.com/blog/a-brief-history-of-the-uuid/)

## How To

```elixir
iex> Ksuid.generate()
"KZi94b2fnVzpGi60FoZgXIvUtYy"
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
