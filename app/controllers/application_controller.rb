class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  layout :layout

  private

  def layout
    ## only turn it off for login pages:
    # is_a?(Devise::SessionsController) ? false : "application"
    ## or turn layout off for every devise controller:
    devise_controller? ? "users" : "application"
  end
end
