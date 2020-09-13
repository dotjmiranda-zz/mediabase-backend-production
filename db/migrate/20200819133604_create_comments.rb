class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.bigint :post_id, null: false
      t.bigint :user_id, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
