require "securerandom"
class ShortenedUrl < ApplicationRecord
    validates :short_url, presence:true,uniqueness:true
    validates :long_url, presence:true#, uniqueness:true
    validates :user_id, presence:true
    def self.create!(user,long_url_string)
        # random_code()
        # ShortenedUrl.
        newobject=self.new(short_url:random_code(),long_url:long_url_string,user_id:user.id)
        newobject.save!
        # ShortenedUrl.save!(short_url:random_code(),long_url:long_url_string,user_id:user.id)
    end
    def self.random_code
    short_url=SecureRandom.base64(16)
    while ShortenedUrl.exists?(short_url:short_url)
    short_url = SecureRandom.base64(16)
    end
    short_url
    end

    belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
