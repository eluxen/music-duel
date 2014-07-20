class ChangeVotesUniqueIndex < ActiveRecord::Migration
  def change
    remove_index :votes, [:duel_id]
    add_index :votes, [:duel_id, :user_id], unique: true
  end
end
