class RemoveProfilePhotoUrlFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :profile_photo_url
  end
end
