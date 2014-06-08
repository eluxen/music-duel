json.array!(@votes) do |vote|
  json.extract! vote, :id, :duel_id, :artist_id, :username
  json.url vote_url(vote, format: :json)
end
