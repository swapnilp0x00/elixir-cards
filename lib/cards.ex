defmodule Cards do
  @moduledoc """
    Provides methods for deck
  """
  def hello do
    :world
  end

  def create_deck do
    values = ["Ace", "Two", "Three"]
    suits = ["Heart", "Spades", "Clubs", "Diamond"]
    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks if card is in the deck
  
  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Creates hand of given size from the given deck

  ##  Examples
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Heart"]
  """
  def deal(deck, size) do
    Enum.split(deck, size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary);
  end

  def load(filename) do 
    # {status, binary} = File.read(filename)
    case File.read(filename) do
      {:ok, binary } ->  :erlang.binary_to_term binary
      {:error, _reason } -> "File doesnt exists"
    end
  end

  def create_hand(hand_size) do 
    # deck = Cards.create_deck
    # deck = Cards.shuffle deck
    # hand = Cards.deal(deck, hand_size)

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
