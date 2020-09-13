class ChangeContentOnPostsAndComments < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :content, :text
    change_column :comments, :content, :text
  end
end
