# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
seed_recipe_data = [
  {
    :recipe_name => 'Scrambled Eggs',
    :recipe_ingredients => ['Eggs', 'Milk', 'Butter'],
    :recipe_instructions => ['Crack eggs', 'Whisk eggs', 'Add milk', 'Fry eggs', 'Serve']
  }, {
    :recipe_name => 'Cereal',
    :recipe_ingredients => ['Cereal', 'Milk'],
    :recipe_instructions => ['Pour Cereal into bowl', 'Add Milk', 'Enjoy!']
  }, {
    :recipe_name => 'PB&J Sandwich',
    :recipe_ingredients => ['Bread', 'Peanut Butter', 'Jam'],
    :recipe_instructions => ['Spread peanut butter on one slice of bread', 'Spread jam on the other slice of bread', 'Make a sandwich', 'Enjoy!']
  }
]

seed_recipe_data.each do |entry|
  this_recipe = Recipe.create!(
    :title => entry.recipe_name
  )
  entry.recipe_instructions.each do |item|
    Instruction.create!(
      :content => item,
      :recipe_id => this_recipe.id
    )
  end
  
  entry.recipe_ingredients.each do |item|
    Ingredient.create!(
      :name => item
    )
  end
end

users = User.create!([
  {
    username: 'glhc',
    first_name: 'Patrick',
    last_name: 'Horne',
    email: 'patrickahorne@gmail.com',
    password_digest: BCrypt::Password.create('Veeam123!')
  }
])

