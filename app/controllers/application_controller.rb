class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_superadmin!
    authenticate_user!

    unless current_user.superadmin?
      redirect_to root_path, alert: 'You are not allowed to perform that action.'
    end
  end
end
