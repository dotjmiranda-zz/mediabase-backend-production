class EditMovieWatchlist < ActiveRecord::Migration[6.0]
  def change
    add_index :movie_watchlists, [:movie_id, :user_id], unique: true
    add_column :movie_watchlists, :status, :integer
  end
end
