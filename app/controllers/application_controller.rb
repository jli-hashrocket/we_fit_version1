class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:last_name, :first_name, :username, :bio, :photo, :location, :gender, :preferred_gender, :activity_ids => []]
    devise_parameter_sanitizer.for(:sign_in) << [:last_name, :first_name, :username, :bio, :photo, :location, :gender, :preferred_gender, :activity_ids => []]

  end

end
