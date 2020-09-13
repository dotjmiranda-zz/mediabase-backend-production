class ChangeIntToFloatInScores < ActiveRecord::Migration[6.0]
  def change
    change_column :movie_scores, :score, :float
  end
end
