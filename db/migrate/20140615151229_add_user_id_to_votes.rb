class AddUserIdToVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :username
    add_column :votes, :user_id, :integer, index: true
  end
end
