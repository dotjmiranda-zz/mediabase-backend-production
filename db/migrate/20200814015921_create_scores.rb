class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.string :title, null: false
      t.string :movie_id, null: false
      t.integer :score

      t.index :score, unique: true

      t.timestamps
    end
  end
end
