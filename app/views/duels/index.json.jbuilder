json.array!(@duels) do |duel|
  json.extract! duel, :id, :deadline, :description
  json.url duel_url(duel, format: :json)
end
