class ChangeContentOnReviews < ActiveRecord::Migration[6.0]
  def change
    change_column :reviews, :media_id, :text
  end
end
