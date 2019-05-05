class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_admin!
    unless current_user.admin?
      flash[:notice] = "You are not authorsied for this action!"
      redirect_to authenticated_root_path
    end
  end
end
