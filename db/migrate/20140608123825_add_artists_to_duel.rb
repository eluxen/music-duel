class AddArtistsToDuel < ActiveRecord::Migration
  def change
    add_column :duels, :artist_a_id, :integer, index: true
    add_column :duels, :artist_b_id, :integer, index: true
  end
end
