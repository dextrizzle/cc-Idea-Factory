class ReviewsController < ApplicationController
  http_basic_authenticate_with name:'jeff', password:'secret',
                               only: :destroy
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
