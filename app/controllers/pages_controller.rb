class PagesController < ApplicationController
  def home
    if session[:pantry].nil? 
      session[:pantry] = {}
    end
    @logged_in_user = User.find_by :id => session[:user_id]
  end

  def results
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

    # place to store recipes found based on ingredients possessed
    retrieved = []

    # put results here from recipe function
    @results = []

    if session[:pantry].nil?
      puts "Redirected to index because session[:pantry] is nil."
      redirect_to '/'
    else  
      # For each ingredient in the pantry, find all recipes
      session[:pantry].each do |id, name|
        this_ingredient = Ingredient.find(id)
        @retrieved.push(this_ingredient.recipes.all)
      end

      # Translate the recipes into objects fully populated with the data they need
      retrieved.each do |item|
        recipe(item[:id])
      end

    end
  end

  # create a recipe
  def create_recipe
    @logged_in_user = User.find_by :id => session[:user_id]
    
    # If the user isn't logged in, turn around bucko
    if @logged_in_user.nil?
      flash[:error] = "You're not logged in, taking you back"
      redirect_to '/'
    else
      # Create the recipes
      Recipe.create(
        :title => params[:title],
        :user_id => params[:user_id].to_i
      )
      
      # Create the instructions for the recipe
      params[:recipe_instructions].each_index do |index|
        Instruction.create!(
          :content => entry[:recipe_instructions][index],
          :step_number => index + 1,
          :recipe_id => this_recipe[:id]
        )
      end

      # Create the ingredients for the recipe
      params[:recipe_ingredients].each do |item|
        this_ingredient = Ingredient.create!(
          :name => item
        )
        this_recipe.ingredients << this_ingredient
      end
    end
  end

  def create_recipe_ingredients
    @ingredients_finished = false
    
    until @ingredients_finished do
      Ingredients.create(
        
      )
    end

    redirect_to '/instructions'
  end

  def recipe_form
  end

  def sign_up
    user = User.create(
      :username => params[:username],
      :first_name => params[:firstName],
      :last_name => params[:lastName],
      :email => params[:email],
      :password_digest => BCrypt::Password.create(params[:password])
    )

    if user
      redirect_to "/signup/success"
    else
      redirect_to "/signup/failure"
    end
  end

  def signup_failure
    sleep(5)
    redirect_to '/signup'
  end

  def signup_success
    sleep(5)
    redirect_to '/login'
  end

  def about
  end
end
