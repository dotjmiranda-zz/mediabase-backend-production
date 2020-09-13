class AddFieldsToMovielist < ActiveRecord::Migration[6.0]
  def change
    add_column :movie_watchlists, :title, :string
    add_column :movie_watchlists, :score, :integer
  end
end
