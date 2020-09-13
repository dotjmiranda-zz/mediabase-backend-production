class LikesController < ApplicationController
  def show_user
    @like = Like.find_by(user_id: params[:user_id], review_id: params[:review_id])

    render json: @like
  end

  def create
    @like = Like.create!(user_id: params[:user_id], review_id: params[:review_id])
  end

  def destroy
    Like.find(params[:id]).destroy!
  end
end