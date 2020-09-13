class ChangeMovieScores < ActiveRecord::Migration[6.0]
  def change
    remove_index :movie_scores, :score
  end
end
