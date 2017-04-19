class IdeasController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @idea = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user

    if @idea.save
      redirect_to @idea
    else
      render 'new'
    end
  end

  def update
    @idea = Idea.find(params[:id])

    if @idea.update(idea_params)
      redirect_to @idea
    else
      render 'edit'
    end
  end

  def show
    @idea = Idea.find(params[:id])
    # @user = User.find(@idea.user_id)
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_path
  end

  def upvote
    @idea = Idea.find(params[:id])
    @idea.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @idea = Idea.find(params[:id])
    @idea.downvote_by current_user
    redirect_to :back
  end
  private

  def idea_params
    params.require(:idea).permit(:title, :text)
  end
end
