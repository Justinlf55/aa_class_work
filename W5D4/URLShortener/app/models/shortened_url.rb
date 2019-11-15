require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :user_id, presence: true 
  validates :long_url, presence: true, uniqueness: true

  def self.random_code
    SecureRandom.urlsafe_base64(16)
  end

  def self.create_short_url(user,long_url)
    code = ShortenedUrl.random_code
    ShortenedUrl.create!(user_id:user.id,long_url:long_url,short_url:code)
  end

  belongs_to :submitter,
  primary_key: :id, 
  foreign_key: :user_id, 
  class_name: :User

  has_many :visits,
  primary_key: :id,  
  foreign_key: :shortenedurl_id,
  class_name: :Visit

  has_many :visitors,
  through: :visits,
  source: :user
  
  
end