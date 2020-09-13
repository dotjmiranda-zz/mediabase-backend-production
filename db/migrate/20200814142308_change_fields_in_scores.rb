class ChangeFieldsInScores < ActiveRecord::Migration[6.0]
  def change
    remove_column :movie_scores, :release_date
    remove_column :movie_scores, :image
    add_column :movie_scores, :image_url, :string
  end
end
