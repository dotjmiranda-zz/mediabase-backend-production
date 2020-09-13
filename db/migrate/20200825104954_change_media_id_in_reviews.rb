class ChangeMediaIdInReviews < ActiveRecord::Migration[6.0]
  def change
    change_column :reviews, :media_id, :string, null: false
  end
end
