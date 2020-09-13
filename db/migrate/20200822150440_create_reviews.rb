class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :content, null: false
      t.bigint :user_id, null: false
      t.string :username, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
