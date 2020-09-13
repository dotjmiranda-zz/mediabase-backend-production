class ChangeProfileUserId < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :userId
    add_column :profiles, :user_id, :bigint
  end
end
