class AddIndexToMovieId < ActiveRecord::Migration[6.0]
  def change
    add_index :movie_scores, :movie_id, unique: true
  end
end
