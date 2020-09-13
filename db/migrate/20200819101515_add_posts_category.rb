class AddPostsCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :category_id, :integer
    remove_column :posts, :ref_id
    add_column :posts, :media_id, :string
  end
end
