class ChangeLongUrlOnShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    change_column :shortened_urls, :long_url, :string, :null => false,unique:true

  end
end
