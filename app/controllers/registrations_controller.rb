class RegistrationsController < Devise::RegistrationsController

  def create
    super
    UserConfirmation.member_info(resource).deliver
  end
  protected

  def after_sign_up_path_for(resource)
    user_path(resource)
  end

  def after_update_path_for(resource)
      user_path(resource)
  end


end
