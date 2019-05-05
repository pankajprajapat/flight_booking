class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!

  def authenticate_admin!
    unless current_user.admin?
      redirect_to authenticated_root_path, notice: 'You are not authorsied for this action!'  
    end
  end
end
