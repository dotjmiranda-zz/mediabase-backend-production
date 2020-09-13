class CreateMovieWatchlists < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_watchlists do |t|
      t.string :movie_id, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end
  end
end
