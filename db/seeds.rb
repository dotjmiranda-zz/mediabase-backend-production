=begin
require 'faker'
require 'csv'

genre_list = %w[Comedy Sci-fi Horror Romance Action Thriller Drama Mystery Crime Animation Adventure Fantasy Comedy-Romance Action-Comedy Superhero]

Movie.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("movies")

512.times do
  Movie.create!(
      title: Faker::Movie.title,
      release: Faker::Date.between(from: '2020-07-22', to: '1900-01-01'),
      duration: Faker::Number.between(from: 30, to: 180),
      genres: genre_list.sample,
      score: Faker::Number.between(from: 1, to: 10),
      synopsis: Faker::Lorem.sentence(word_count: 128)
  )
end
=end

require 'faker'

User.create!(
    email: "admin@gmail.com",
    password: "administrator",
    username: "Administrator",
    admin: true
)

User.create!(
    email: "moderator@gmail.com",
    password: "moderator",
    username: "Moderator",
    moderator: true
)

User.create!(
    email: "dot@gmail.com",
    password: "dotdot",
    username: "dotMiranda"
)

User.create!(
    email: "ana@gmail.com",
    password: "password",
    username: "AnaConta"
)

User.create!(
    email: "andre@gmail.com",
    password: "password",
    username: "Tofanil"
)

User.create!(
    email: "alexandra@gmail.com",
    password: "password",
    username: "Cabbatsu"
)

User.create!(
    email: "antonio@gmail.com",
    password: "password",
    username: "Antoniopee"
)

