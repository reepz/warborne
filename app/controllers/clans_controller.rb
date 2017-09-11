class ClansController < ApplicationController
  def index
    @users = User.order(:clan_rank, hl_mmr: :desc)
  end
end
