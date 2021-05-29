class Tagging < ApplicationRecord

    belongs_to :tag_topic,
    class_name: :TagTopic,
    primary_key: :id,
    foreign_key: :tagging_id
    
    belongs_to :shortened_url,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :shortened_url_id

end