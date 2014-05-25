json.array!(@artists) do |artist|
  json.extract! artist, :id, :name, :default_song_url, :profile_photo_url
  json.url artist_url(artist, format: :json)
end
