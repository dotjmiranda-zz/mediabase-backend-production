class ChangePhotosOnProfile < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :photos
    add_column :profiles, :photo, :string
  end
end
