class CreateSeriesScores < ActiveRecord::Migration[6.0]
  def change
    create_table :series_scores do |t|
      t.string :title, null: false
      t.string :series_id, null: false
      t.float :score
      t.integer :members
      t.string :image_url
      t.index ["series_id"], name: "index_series_scores_on_series_id", unique: true

      t.timestamps
    end
  end
end
