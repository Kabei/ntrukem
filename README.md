# NtruKem

NTRU-KEM Erlang-port, NTRU-HRSS-KEM is a post-quantum cryptography  library (Public-key Encryption and Key-establishment Algorithm)

[Website](https://ntru-hrss.org)

## Features
|Feature    |Size (bytes)|
|-----------|-----|
|Seed       | 48  |
|Public key | 1138|
|Secret key | 1418|
|Ciphertext | 1278|
|Shared Key | 32  |

## Compilation

Install build-essential and erlang-dev before compile

```bash
mix deps.get
mix compile
```

## Installation
```elixir
def deps do
  [
    {:ntrukem, "~> 0.1.0"}
  ]
end
```

Umbrella Projects:
```elixir
def deps do
  [
    {:ntrukem, in_umbrella: true}
  ]
end
```

## Test
```bash
mix run test/ntru_test.exs
```


