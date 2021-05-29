class TagTopic < ApplicationRecord
    
  has_many :taggings,
  primary_key: :id,
  foreign_key: :tagging_id,
  class_name: :Tagging

  has_many :shortened_urls,
  through: :taggings,
  source: :shortened_url

  
  def popular_links
    popular_urls=[]
    self.shortened_urls.each do |url| 
      popular_urls << [url.num_clicks,url]
      return popular_urls if popular_urls.length >=5
      
    end
    popular_urls
  end
end