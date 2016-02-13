class RecipesController < ApplicationController
  before_action :authorize
  before_action :set_recipe, only: [:show, :edit, :update, :destroy ]

	def index
		@recipes = @current_user.recipes.all
	end

	def new
	    @recipe = Recipe.new
	end
	
	def create
	    @recipe = Recipe.new(recipe_params)
      @recipe.user = current_user
	    if @recipe.save
	      redirect_to @recipe, notice: "Successfully created recipes."
	    else
	      render :new
	    end
	end
  
  def show
    @comment = Comment.new
  end
  
  def edit
  end
  
  def update
    if @recipe.update_attributes(recipe_params)
      redirect_to @recipe, notice: "Successfully saved recipe."
    else
      render :edit
    end
  end
  
  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe deleted."
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:title,:ingredients,:directions)
  end

  def set_recipe
    @recipe = current_user.recipes.find(params[:id])
  end
  
end