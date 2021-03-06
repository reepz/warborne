class User < ApplicationRecord

  before_save :get_hots_logs_user_data

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    admin == true
  end

  def display_clan_rank
    case clan_rank
    when 1
      'BTNHeroTaurenChieftain'
    when 2
      'BTNShaman'
    when 3
      'BTNGrunt'
    when 4
      'BTNPeon'
    end
  end

  def full_battle_tag
    "#{nick.downcase}##{battle_tag}"
  end

  def hots_logs_battle_tag
    "#{nick.downcase}_#{battle_tag}"
  end

  def display_division_name
    case hl_division
    when 0
      'Master'
    when 1
      'Diamond'
    when 2
      'Platinum'
    when 3
      'Gold'
    when 4
      'Silver'
    when 5
      'Bronze'
    end
  end

  def get_hots_logs_user_data
    url = "https://api.hotslogs.com/Public/Players/2/#{hots_logs_battle_tag}"
    response = HTTParty.get(url).parsed_response
    self.hl_mmr = response["LeaderboardRankings"][1]["CurrentMMR"]
    self.hl_division = response["LeaderboardRankings"][1]["LeagueID"]
  end

end
