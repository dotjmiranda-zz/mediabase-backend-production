class AddImageUrlToMovielist < ActiveRecord::Migration[6.0]
  def change
    add_column :movie_watchlists, :image_url, :string
  end
end
