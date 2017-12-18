class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
 
  def admin_required
    if !current_user.admin?
    redirect_to homepages_path, alert: "You are not admin."
    end
  end
end
