class RemoveIndexOnSeriesWatchlist < ActiveRecord::Migration[6.0]
  def change
    remove_index :watchlist_series, :user_id
  end
end
