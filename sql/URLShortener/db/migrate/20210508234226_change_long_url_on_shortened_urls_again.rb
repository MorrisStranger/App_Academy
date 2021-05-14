class ChangeLongUrlOnShortenedUrlsAgain < ActiveRecord::Migration[6.0]
  def change
    change_column :shortened_urls, :long_url, :string, :null => false
    change_column :shortened_urls, :short_url, :string, :null => false, uniqueness:true

  end
end
