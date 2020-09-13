class AddFieldsToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :members, :integer
    add_column :scores, :release_date, :string
    add_column :scores, :image, :string
  end
end
