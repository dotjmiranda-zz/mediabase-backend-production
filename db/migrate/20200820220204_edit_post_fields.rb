class EditPostFields < ActiveRecord::Migration[6.0]
  def change
    change_column_null :posts, :media_id, true
  end
end
