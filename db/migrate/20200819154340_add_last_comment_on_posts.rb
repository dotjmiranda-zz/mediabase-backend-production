class AddLastCommentOnPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :last_comment_user, :string
    add_column :posts, :last_comment_time, :datetime
  end
end
