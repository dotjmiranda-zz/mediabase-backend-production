class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.bigint :userId, null: false

      t.timestamps
    end
  end
end
