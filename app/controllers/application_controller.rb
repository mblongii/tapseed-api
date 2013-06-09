class ApplicationController < ActionController::API
  before_filter :authenticate!

private
  def authenticate!
    @designer = Designer.find_by(auth_token: request.headers["Auth-Token"])
    render :json => { error: "Invalid token." }, 
        success: :false, status: :unauthorized unless @designer
  end

  def designer
    @designer
  end
end
