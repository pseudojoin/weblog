# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create simple 10 Articles without comments
10.times do |t|
  Article.create(
    title: "Article" + t.to_s,
    text: "Article_Text_" + t.to_s,
  )
end
