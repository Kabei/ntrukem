ExUnit.start()

defmodule NtruKemTest do
  use ExUnit.Case
  doctest NtruKem

  @seed_size 48
  @pub_size 1138
  @secret_key_size 1418
  @cipher_size 1278
  @shared_key_size 32

  test "gen_keys" do
    {:ok, pk, sk} = NtruKem.gen_key_pair()
    IO.puts("public_key_size #{byte_size(pk)} bytes")
    IO.puts("secret_key_size #{byte_size(sk)} bytes")
    assert byte_size(pk) == @pub_size, "pubkey no has #{@pub_size} bytes"
    assert byte_size(sk) == @secret_key_size, "secretkey no has #{@secret_key_size} bytes"
  end

  test "seed" do
    seed = :crypto.strong_rand_bytes(@seed_size)
    {:ok, pk, sk} = NtruKem.gen_key_pair_from_seed(seed)
    assert byte_size(pk) == @pub_size, "pubkey no has #{@pub_size} bytes"
    assert byte_size(sk) == @secret_key_size, "secretkey no has #{@secret_key_size} bytes"
  end

  test "encapsulation and decapsulation" do
    {:ok, pk, sk} = NtruKem.gen_key_pair()
    {:ok, cipher, sharedkey} = NtruKem.enc(pk)

    assert byte_size(sharedkey) == @shared_key_size, "sharedkey no has #{@shared_key_size} bytes"
    assert byte_size(cipher) == @cipher_size, "cipher no has #{@cipher_size} bytes"

    {:ok, sharedkey_dec} = NtruKem.dec(sk, cipher)
    assert sharedkey_dec == sharedkey, "Error decapsulation process"
  end

  test "seed enc/dec" do
    seed = :crypto.strong_rand_bytes(@seed_size)
    {:ok, pk, sk} = NtruKem.gen_key_pair_from_seed(seed)
    {:ok, pk2, sk2} = NtruKem.gen_key_pair_from_seed(seed)
    assert pk == pk2, "publickey is wrong"
    assert sk == sk2, "secretkey is wrong"
  end
end
