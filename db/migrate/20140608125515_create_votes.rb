class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :duel, index: true
      t.references :artist, index: true
      t.string :username

      t.timestamps
    end
  end
end
