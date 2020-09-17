class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :update, :destroy]
  load_and_authorize_resource

  def index
    @users = User.all.order(:id).select(:id, :username, :admin, :moderator)

    render json: @users
  end

  def show
    @user = User.select(:username, :comments_count, :id).find(params[:id])

    render json: @user
  end

  def update
    @user = User.find(params[:id])

    @user.update!(
        admin: params[:admin],
        moderator: params[:mod]
    )
  end

  def destroy
    User.find(params[:id]).destroy!
  end
end