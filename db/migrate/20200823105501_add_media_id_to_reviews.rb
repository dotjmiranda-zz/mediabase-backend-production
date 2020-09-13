class AddMediaIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :media_id, :string, null: false
  end
end
