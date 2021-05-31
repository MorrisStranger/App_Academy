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
        newobject
        # ShortenedUrl.save!(short_url:random_code(),long_url:long_url_string,user_id:user.id)
    end
    def self.random_code
    short_url=SecureRandom.base64(16)
    while ShortenedUrl.exists?(short_url:short_url)
    short_url = SecureRandom.base64(16)
    end
    short_url
    end
    has_many :visits, dependent: :destroy,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit


    belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

    has_many :visitors,
    Proc.new {distinct},
    through: :visits,
    source: :visitor

    has_many :taggings, dependent: :destroy,
    primary_key: :id,
    foreign_key: :tagging_id,
    class_name: :Tagging

    has_many :tag_topics,
    through: :taggings,
    source: :tag_topic
    #associated to Visits.shortened_url on visits.rb
    def num_clicks
        self.visits.length
    end
    def num_uniques
        self.visitors.select(:user_id).count
    end
    def num_recent_uniques
        self.visits.where("created_at>'#{10.minutes.ago(Time.now)}'").select(:user_id).distinct.count
        
    end
    validate :no_spamming
    validate :nonpremium_max
    private
    def no_spamming()
        p "helloooooo"
        user = submitter()
        p user
        
        # p user.submitted_urls.last(5)
        p "-----------------------------------------"
        urls = user.submitted_urls.last(5)
        p "-----------------------------------------"

        p urls
        p "-----------------------------------------"
        p urls.all? {|record| record.created_at > 1.minutes.ago }
        p "-----------------------------------------"
        p urls.length
         if urls.all? {|record| record.created_at > 1.minutes.ago } && urls.length>=6
         errors[:user] << "cant submit more than 5 urls a minute"
        end
    end
    def nonpremium_max
        user = submitter()
        if !user.premium && user.submitted_urls.length>5
            errors[:user] << "cant have more than 5 urls"
        end
    end
    def self.prune(n)
        # ShortenedUrl.left_outer_joins(:visits).where(visits:{id:nil})

        ShortenedUrl.left_outer_joins(:visits) \
        .where("visits.created_at<'#{n.minutes.ago}'")\
        .or(ShortenedUrl.left_outer_joins(:visits).where(visits:{id:nil}).where("shortened_urls.created_at<'#{n.minutes.ago}'"))\
        .destroy_all
    end
end





=begin
#visitors association for shortened url
#this method gets the visits from the users table by going
from the shortened url through the visits to get the user_id
then to the users table
then  



=end