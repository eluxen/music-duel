class RenameDefaultSongUrlToYoutubeIdInArtists < ActiveRecord::Migration
  def change
    rename_column :artists, :default_song_url, :youtube_id
  end
end
