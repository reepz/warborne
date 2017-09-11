class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nick, :battle_tag)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nick, :battle_tag, :current_password)
  end

  protected

  def after_sign_in_path_for(user)
    clans_index_path
  end

  def after_sign_up_path_for(user)
    clans_index_path
  end
end
