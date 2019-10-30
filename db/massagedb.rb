require 'json'

mock_layer1 = [
  {
    id: 'String',  // unique 10-digit hex string
    title: 'String',
    instructions: [ { text: 'String' } ],
    ingredients: [ { text: 'String' } ],
    partition: ('train'|'test'|'val'),
    url: 'String'
  }
]

input_hash = JSON.parse(mock_layer1)


input_hash.each do |entry|

  this_recipe = Recipe.create!(
    :title => entry[:recipe_name]
  )
  entry[:recipe_instructions].each_index do |index|
    Instruction.create!(
      :content => entry[index],
      :step_number => index + 1,
      :recipe_id => this_recipe[:id]
    )
  end
  
  entry[:recipe_ingredients].each do |item|
    this_ingredient = Ingredient.create!(
      :name => item
    )
    this_recipe.ingredients << this_ingredient
  end
end