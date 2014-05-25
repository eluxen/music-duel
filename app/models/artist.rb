class Artist < ActiveRecord::Base
   validates :name, presence: true, uniqueness: true
   validates_format_of :default_song_url, :profile_photo_url, :with => /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
end
