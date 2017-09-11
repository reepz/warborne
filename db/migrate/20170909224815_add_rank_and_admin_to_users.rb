class AddRankAndAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean, default: false
    # available clan ranks:
    # 1 - chieftain (leader)
    # 2 - shaman (officer)
    # 3 - grunt (normal member)
    # 4 - peon (trial, punishment rank)
    add_column :users, :clan_rank, :integer,  default: 4
  end
end
