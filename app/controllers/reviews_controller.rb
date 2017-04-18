class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def create
    @idea = Idea.find(params[:idea_id])
    @review = @idea.reviews.create(review_params)
    redirect_to idea_path(@idea)
  end

  def destroy
    @idea = Idea.find(params[:idea_id])
    @review = @idea.reviews.find(params[:id])
    @review.destroy
    redirect_to idea_path(@idea)
  end
  private

  def review_params
    params.require(:review).permit(:reviewer, :body)
  end
end
