class ProfilesController < ApplicationController
  def show
    # sends back profile data by its username
    user = User.find_by_username(params[:username])
    profile = Profile.find_by_user_id(user.id)

    profile_info = Hash.new
    profile_info["user_id"] = user.id
    profile_info["username"] = user.username
    profile_info["name"] = profile.name unless profile.name.blank?

    render json: profile_info
  end

  def update
    @profile = Profile.find_by_user_id(params[:id])


  end

  def avatar
    @profile = Profile.find_by_user_id(params[:id])

    if @profile.avatar.attached?
      redirect_to rails_blob_url(@profile.avatar)
    else
      head :not_found
      render json: "Not found"
    end
  end
end