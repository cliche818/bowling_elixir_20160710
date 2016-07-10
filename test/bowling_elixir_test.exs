defmodule BowlingElixirTest do
  use ExUnit.Case
  doctest BowlingElixir

  test "should return the score of a game with no spare of strike" do
    assert BowlingElixir.score([[1,1], [2,2]]) == 6
  end

  test "should return the score of a game with a spare" do
    assert BowlingElixir.score([[5,5], [5, 1]]) == 21 # 15 + 6
  end

  test "should return the score of a game with a spare at the last round" do
    assert BowlingElixir.score([[5,5], [4,6,1]]) == 25 # 14 + 11
  end

  test "should return the score of a game with strike" do
    assert BowlingElixir.score([[10], [5,4],[1,1]]) == 30 # 19 + 9 + 2
  end

  test "should return the score of a game with 2 strikes in a row" do
    assert BowlingElixir.score([[10], [10],[1,1]]) == 35 # 21 + 12 + 2
  end

  test "should return the score of a perfect game" do
    assert BowlingElixir.score([[10], [10,10,10]]) == 60 # 30 + 30
  end
end
