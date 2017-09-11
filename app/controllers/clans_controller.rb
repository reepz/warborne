class ClansController < ApplicationController
  def index
    @users = User.order(:clan_rank)
  end
end
