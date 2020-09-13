class CreateWatchlistSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :watchlist_series do |t|
      t.string :movie_id, null: false
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :score
      t.integer :status
      t.index ["movie_id", "user_id"], name: "index_watchlist_series_on_movie_id_and_user_id", unique: true

      t.timestamps
    end
  end
end
