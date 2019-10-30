class Ingredient < ApplicationRecord
  has_and_belongs_to_many :recipes
  :before_save do
    # logic for downcasing entries here
  end
end
