class CommentsController < ApplicationController
before_action :set_recipe
  before_action :set_comment, only: [:edit, :update, :show, :destroy]
  
  def create
    @comment = Comment.new(comment_params)
    if @recipe.comments << @comment
      redirect_to @recipe, notice: "Created Comment"
    else
      render :new
    end
  end
  
  def edit 
  end
  
  def show
  end
  
  def update
    if @comment.update_attributes(comment_params)
      redirect_to [@recipe,@comment], notice: "Comment Updated."
    else
      render :edit
    end
  end
  
  def destroy 
    @comment.destroy
    redirect_to @recipe
  end
  
  private
  
  def set_comment
    @comment = @recipe.comments.find(params[:id])
  end
  
  def comment_params
    params.require(:comment).permit(:title,:content)
  end
end