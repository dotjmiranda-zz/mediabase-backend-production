class AddPhotoToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :photos, :string
  end
end
