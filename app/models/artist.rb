require 'cgi'
require 'uri'

class Artist < ActiveRecord::Base
  belongs_to :vote
  acts_as_taggable_on :tags

  attr_accessor :default_song_url

  validates :name, presence: true, uniqueness: true
  validates_format_of :default_song_url, :with => /\A(http|https):\/\/(www\.)?youtube\.com(\/.*)?\z/ix, message: "%{value} is not a valid youtube video."

  before_save :set_youtube_id

  def defualt_embedded_song_url
    "https://www.youtube.com/embed/#{youtube_id}?rel=0&showinfo=0&controls=0"
  end

  def default_song_url
    "https://www.youtube.com/watch?v=#{youtube_id}" if youtube_id
  end

  def set_youtube_id
    params = CGI::parse(@default_song_url)

    first_param = params[params.keys.first].first
    unless (first_param.blank?)
      self.youtube_id = params[params.keys.first].first
    else
      self.youtube_id = URI(@default_song_url).path.split('/').last
    end
  end
end