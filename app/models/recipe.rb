class Recipe < ApplicationRecord
  has_many :ingredients, through: :ingredients_recipes
  has_many :instructions, through: :instructions_recipes
end
