class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  load_and_authorize_resource

  def index
    @users = User.all.order(:id)

    render json: @users
  end

  def show
    @user = User.select(:username, :comments_count).find(params[:id])

    render json: @user
  end
end