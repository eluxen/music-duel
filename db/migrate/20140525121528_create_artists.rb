class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :default_song_url
      t.string :profile_photo_url

      t.timestamps
    end
  end
end
