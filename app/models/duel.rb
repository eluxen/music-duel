class Duel < ActiveRecord::Base
  belongs_to :artist_a, class_name: "Artist", foreign_key: 'artist_a_id'
  belongs_to :artist_b, class_name: "Artist", foreign_key: 'artist_b_id'
  has_many :votes, dependent: :destroy

  validates :artist_a, :artist_b, presence: true

  def artist_a_name
    artist_a.name if artist_a
  end

  def artist_b_name
    artist_b.name if artist_b
  end

  def artist_a_name=(name)
    self.artist_a.name = Artist.find_by(name: name) unless name.blank?
  end

  def artist_b_name=(name)
    self.artist_b.name = Artist.find_by(name: name) unless name.blank?
  end

  def voted?
  end

  def artist_a_voters
    votes.where(artist_id: artist_a.id)
  end

  def artist_b_voters
    votes.where(artist_id: artist_b.id)
  end

  def formated_deadline
    deadline ? deadline.strftime('%d/%m/%Y %H:%M') : DateTime.now.strftime('%d/%m/%Y %H:%M')
  end
end
