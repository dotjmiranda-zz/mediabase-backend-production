class ChangePostsIds < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :category_id, :integer, :null => false
    change_column :posts, :media_id, :string, :null => false
  end
end
