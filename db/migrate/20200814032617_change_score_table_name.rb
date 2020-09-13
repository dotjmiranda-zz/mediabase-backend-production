class ChangeScoreTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :scores, :movie_scores
  end
end
