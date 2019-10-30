class SearchController < ApplicationController
  def search
    p params[:q]
    p Ingredient.find_by(name: params[:ingredient_name])
  end

  def results
  end
end
