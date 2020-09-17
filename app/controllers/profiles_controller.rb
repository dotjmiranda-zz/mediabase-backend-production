class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all

    render json: @profiles
  end

  def show
    # sends back profile data by its username
    @user = User.find_by_username(params[:username])
    @profile = Profile.find_by_user_id(@user.id)

    @profile_info = Hash.new
    @profile_info["user_id"] = @user.id
    @profile_info["username"] = @user.username
    @profile_info["name"] = @profile.name unless @profile.name.blank?
    @profile_info["avatar"] = @profile.photo unless @profile.photo.blank?
    @profile_info["gender"] = @profile.gender unless @profile.gender.blank?
    @profile_info["birthday"] = @profile.birthday unless @profile.birthday.blank?
    @profile_info["joined"] = @user.created_at

    render json: @profile_info
  end

  def update
    @user = User.find_by_username(params[:username])
    @profile = Profile.find_by_user_id(@user.id)

    if params[:avatar]
      @profile.avatar.attach(params[:avatar])
      @profile.update!(
          name: params[:name],
          gender: params[:gender],
          birthday: params[:birthday],
          photo: url_for(@profile.avatar)
      )
    else
      @profile.update!(
          name: params[:name],
          gender: params[:gender],
          birthday: params[:birthday],
          )
    end

    render json: @profile
  end

=begin
  def avatar
    @profile = Profile.find_by_user_id(params[:id])

    if @profile.avatar.attached?
      redirect_to rails_blob_url(@profile.avatar)
    else
      head :not_found
      render json: "Not found"
    end
  end
=end
end