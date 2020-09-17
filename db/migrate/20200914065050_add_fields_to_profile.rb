class AddFieldsToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :gender, :integer, null: true
    add_column :profiles, :birthday, :date, null: true
    change_column_null :profiles, :name, true
  end
end
