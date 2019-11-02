class PagesController < ApplicationController
  def home
    if session[:pantry].nil? 
      session[:pantry] = {}
    end
    @logged_in_user = User.find_by :id => session[:user_id]
  end
  
  def results
    
    # place to store recipes found based on ingredients possessed
    @retrieved = []
    
    # put results here from recipe function
    @results = []
    
    # create recipe objects for easy rendering in results view
    def recipe (recipe_id, name)
      if recipe_id
       this_recipe = Recipe.find(recipe_id.to_i)
      else
       this_recipe = Recipe.find_by(name)
      end

      creation = {
          :name => this_recipe[:name],
          :instructions => this_recipe.instructions.all,
          :ingredients => this_recipe.ingredients.all
      }
      # return the object
      creation
    end


    if session[:pantry].nil?
      puts "Redirected to index because session[:pantry] is nil."
      redirect_to '/'
    else
      p "pantry:"
      p session[:pantry]  
      # For each ingredient in the pantry, find all recipes
      session[:pantry].each do |id, name|
        this_ingredient = Ingredient.find_by(name: name)
        these_recipes = this_ingredient.recipes.all
        these_recipes.each do |item|
          @retrieved.push(item)
        end

      end

    end
  end

  # create a recipe
  def create_recipe
    @logged_in_user = User.find_by :id => session[:user_id]
    @userid = @logged_in_user[:id].to_i

      # Create the recipes
      @this_recipe = Recipe.create(
        :title => params[:title],
        :user_id => @logged_in_user[:id].to_i
      )
      
      @counter = 0
      # Create the instructions for the recipe
      params[:instruction].each do |item|
        @counter += 1
        this_instruction = Instruction.create!(
          :content => item,
          :step_number => @counter,
          :recipe_id => @this_recipe[:id]
        )

        @this_recipe.instructions << this_instruction
      end


      # Create the ingredients for the recipe
      params[:ingredient].each do |item|
        this_ingredient = Ingredient.find_or_create_by(
          :name => item
        )

        @this_recipe.ingredients << this_ingredient
      end
      flash[:user_create] = "Recipe created!"
      # redirect_to '/'
  end

  def render_sign_up
  end

  def sign_up
    @user = User.create(
      :username => params[:username],
      :first_name => params[:firstName],
      :last_name => params[:lastName],
      :email => params[:email],
      :password_digest => BCrypt::Password.create(params[:password])
    )
    flash[:user_created] = @user[:first_name]
  redirect_to '/'
  end

  def recipe
    @recipe = Recipe.find_by(id: params[:id].to_i)
  end

  def recipe_destroy
    recipe = Recipe.find(params[:id].to_i)
    recipe.destroy
    redirect_to '/'
  end

end