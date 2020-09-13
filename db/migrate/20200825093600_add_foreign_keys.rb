class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key "movie_watchlists", "users"
    add_foreign_key "reviews", "users"
    add_foreign_key "profiles", "users"
    add_foreign_key "posts", "users"
    add_foreign_key "comments", "posts"
    add_foreign_key "comments", "users"
  end
end
