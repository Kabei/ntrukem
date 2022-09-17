defmodule NtruKem do
  @on_load :load_nifs
  @file_version 0
  @type_alg "KEM"

  def load_nifs do
    :code.priv_dir(:ntrukem)
    |> :filename.join('ntrukem_nif')
    |> :erlang.load_nif(0)
  end

  @spec gen_key_pair() :: {:ok, pubkey :: binary(), privkey :: binary()} | {:error, atom()}
  def gen_key_pair do
    raise "Function gen_key_pair is not implemented!"
  end

  @spec gen_key_pair_from_seed(binary()) ::
          {:ok, pubkey :: binary(), privkey :: binary()} | {:error, atom()}
  def gen_key_pair_from_seed(_seed) do
    raise "Function gen_key_pair_from_seed is not implemented!"
  end

  @spec enc(binary()) :: {:ok, ciphertext :: binary, sharedkey :: binary} | :error
  def enc(pubkey)

  def enc(_) do
    raise "Function enc is not implemented!"
  end

  @spec dec(binary(), binary()) :: {:ok, sharekey :: binary()} | :error
  def dec(privkey, ciphertext)

  def dec(_, _) do
    raise "Function dec is not implemented!"
  end

  def pubkey_size, do: 1138
  def secret_key_size, do: 1418
  def ciphertext_size, do: 1278

  def read_file!(path) do
    <<file_version::8, type::bytes-size(3), rest::binary>> = File.read!(path)

    cond do
      file_version != @file_version ->
        throw(:bad_version)

      type != @type_alg ->
        throw(:bad_type)

      true ->
        <<pk::bytes-size(1138), sk::bytes-size(1418)>> = rest
        {pk, sk}
    end
  end

  @spec write_file!(Path.t(), {iodata, iodata}) :: :ok
  def write_file!(path, {pk, sk}) do
    data = <<@file_version::8>> <> @type_alg <> pk <> sk
    File.write!(path, data)
  end
end
