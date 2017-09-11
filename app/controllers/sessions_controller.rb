class SessionsController < Devise::SessionsController

  protected

  def after_sign_in_path_for(user)
    clans_index_path
  end
end
