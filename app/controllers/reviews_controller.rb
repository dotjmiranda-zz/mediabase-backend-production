class ReviewsController < ApplicationController
  def new

  end

  def create
    @review = Review.create!(
        user_id: params[:user_id],
        username: params[:username],
        media_id: params[:media_id],
        content: params[:content],
        rating: params[:rating]
    )
  end

  def index
    @reviews = Review.all.order(created_at: :desc)

    render json: @reviews
  end

  def index_media
    @reviews = Review.all.where(:media_id => params[:media_id])

    render json: @reviews
  end

  def index_user
    @reviews = Review.all.where(:user_id => params[:user_id])
  end
end