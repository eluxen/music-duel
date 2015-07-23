class User < ActiveRecord::Base
  has_many :votes
  include TheRole::User
  
  validates_uniqueness_of :uid, scope: :provider

  def self.from_auth(auth)
   where(provider: auth["provider"], uid: auth["uid"]).first
  end
  def self.create_from_auth(auth)
    new({
      uid:           auth["uid"],
      provider:      auth["provider"],
      refresh_token: auth["credentials"]["refresh_token"],
      access_token:  auth["credentials"]["token"],
      expires:       auth["credentials"]["expires_at"],
      first_name:    auth["info"]["first_name"],
      last_name:     auth["info"]["last_name"],
      image:         auth["info"]["image"],
      email:         auth["info"]["email"]
    })
  end

  def name
    "#{first_name} #{last_name}"
  end

  def gravatar_image_url
    return image unless image.ends_with('.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/s100/photo.jpg?sz=50')
    hash = Digest::MD5.hexdigest(email)

    "http://www.gravatar.com/avatar/#{hash}?s=100"
  end

  private 

  def token_is_valid?
    token_validation[:audience] == ENV['GOOGLE_KEY']
  end

  def refresh_access_token!
    body = {
      'refresh_token' => self.refresh_token,
      'client_id'     => ENV['GOOGLE_KEY'],
      'client_secret' => ENV['GOOGLE_SECRET'],
      'grant_type'    => 'refresh_token'
    }
    response = Typhoeus.post("https://accounts.google.com/o/oauth2/token", body: body)
    user_tokens = JSON.parse(response.body)

    self.access_token = user_tokens['access_token']
    self.expires = user_tokens['expires_in']
    save
  end

  def token_validation
    @token_validation ||= begin
      options  = {
        :params => { :access_token => self.access_token }
      }
      response = Typhoeus.get("https://www.googleapis.com/oauth2/v1/tokeninfo", options)
      HashWithIndifferentAccess.new(JSON.parse(response.body))
    end
  end
end
