class RegistrationsController < Devise::RegistrationsController
  def new
    super
    @activities = Activity.all
  end

  protected
  def after_sign_up_path_for(resource)
    user_path(resource)
  end
end
