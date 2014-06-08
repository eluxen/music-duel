class AddArtistsToDuel < ActiveRecord::Migration
  def change
    add_column :duels, :artist_a_id, :integer
    add_column :duels, :artist_b_id, :integer 
  end
end
