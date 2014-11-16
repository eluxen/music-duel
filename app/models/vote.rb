class Vote < ActiveRecord::Base
  belongs_to :duel
  belongs_to :user
  has_one :artist

  validates_uniqueness_of :user_id, :scope => :duel

  scope :for_duel,  -> (duel) {where(duel_id: duel.id)}
  scope :for_artist, -> (artist) {where("votes.artist_id = #{artist.id}")}

  def self.already_voted?(user, duel)
    for_duel(duel).pluck(:user_id).include? user.id
  end
end
