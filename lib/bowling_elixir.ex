defmodule BowlingElixir do
  def score(frames) do
    score_helper(frames, 0)
  end

  defp score_helper([[10], [10, 10, pins]], total_score) do
    score_helper([[10, 10, pins]], total_score + 10 + 10 + 10)
  end

  defp score_helper([[10], [10] | tail], total_score) do
    score_helper([[10]] ++ tail, total_score + 10 + 10 + Enum.at(Enum.at(tail,0), 0))
  end

  defp score_helper([[first_ball] | tail], total_score) when first_ball == 10 do
    score_helper(tail, total_score + first_ball + Enum.at(Enum.at(tail,0), 0) + Enum.at(Enum.at(tail,0), 1))
  end

  defp score_helper([[first_ball, second_ball] | tail ], total_score) when first_ball + second_ball == 10 do
    score_helper(tail, total_score + first_ball + second_ball + Enum.at(Enum.at(tail,0), 0))
  end

  defp score_helper([[first_ball, second_ball] | tail], total_score) do
    score_helper(tail, total_score + first_ball + second_ball)
  end

  defp score_helper([[first_ball, second_ball, third_ball]], total_score) do
    total_score + first_ball + second_ball + third_ball
  end

  defp score_helper([], total_score) do
    total_score
  end
end
