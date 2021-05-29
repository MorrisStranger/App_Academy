class User < ApplicationRecord
    validates :email, presence:true, uniqueness:true
    # validates :submitted_urls, presence:true
    has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl

    #associated to Visit.user on visit.rb
    has_many :visits,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Visit

    has_many :visited_urls,
    Proc.new {distinct},
    through: :visits,
    source: :shortened_url
    
    
end

=begin
visited_urls goes from user to visits table to shortened_urls
=end

