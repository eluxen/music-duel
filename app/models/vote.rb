class Vote < ActiveRecord::Base
  belongs_to :duel
  belongs_to :user
  has_one :artist

  validates_uniqueness_of :user_id, :scope => :duel

  scope :for_duel, -> (duel, user) {where(duel_id: duel.id, user_id: user.id)}
end
