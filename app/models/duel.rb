class Duel < ActiveRecord::Base
  has_one :artist, through: :artist_a
  has_one :artist, through: :artist_b

  validates :artist_a, :artist_b, presence: true
end
