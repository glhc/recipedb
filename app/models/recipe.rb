class Recipe < ApplicationRecord
  has_and_belongs_to_many :ingredients
  has_many :instructions
end
