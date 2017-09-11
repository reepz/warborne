class AddAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nick,        :string,  null: false
    add_column :users, :battle_tag,  :integer, null: false
    add_column :users, :clan_id,     :integer, default: 1
    add_column :users, :hl_mmr,      :integer
    add_column :users, :hl_division, :integer

    add_index :users, :clan_id
  end
end
