class SearchController < ApplicationController

  def search
    result = Ingredient.find_by(name: params[:ingredient_name])
    if result
      @pantry = result
      session[:pantry][result[:id]] = result[:name]
    else
      flash[:error] = "No result found!"
    end

    
  end

  def results

  end
end
