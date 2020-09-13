class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { render json: "Unauthorized access.", status: 403 }
    end
  end
end
