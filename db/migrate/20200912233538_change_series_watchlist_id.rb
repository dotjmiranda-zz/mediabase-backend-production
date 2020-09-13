class ChangeSeriesWatchlistId < ActiveRecord::Migration[6.0]
  def change
    remove_index :watchlist_series, column: [:movie_id, :user_id]
    remove_column :watchlist_series, :movie_id

    add_column :watchlist_series, :series_id, :string
    add_index :watchlist_series, [:series_id, :user_id], unique: true
  end
end
