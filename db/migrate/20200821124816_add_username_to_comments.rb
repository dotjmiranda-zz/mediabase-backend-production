class AddUsernameToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :username, :string, null: false
  end
end
