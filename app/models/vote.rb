class Vote < ActiveRecord::Base
  belongs_to :duel
  has_one :artist

  validates_uniqueness_of :username, :scope => :duel
end
