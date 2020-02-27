require 'open-uri'
require 'faker'

# don't need to require JSON since it's already isntalled

puts "Cleaning the database of drinks..."
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DOSES = ['1 part', '2 parts', '3 parts', '3 leaves', '2 leaves', 'a squeeze', 'a pinch', 'a headbutt']
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ing_read = open(url).read
data = JSON.parse(ing_read)
data['drinks'].each do |drink| #looped over my 'drinks' hash
  Ingredient.create(name: drink['strIngredient1']) #Ingredient will create instances
#     # from the iteration and save them automatically to the DB with the create method.
#     # you then use name: to ID the value with the ingredients table.
#     # drink['strIngredient1'] is the paramter['key from JSON'] = value from JSON
#     # ie. the ingredient that I want
end

10.times do
  cocktail = Cocktail.new(
    name: Faker::Hipster.sentence(word_count: 2))
  cocktail.save

rand(1..5).times do
  dose = Dose.new(
    cocktail: cocktail,
    ingredient: Ingredient.all.sample,
    description: DOSES.sample
    )
  dose.save
  end
end












