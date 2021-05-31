namespace :prune do
	desc "prune urls that have not been visited for n minutes and urls that have never been visited
        \ and were created n minutes ago from ShortenedURL model" 
	task prune_old_urls: :environment do
		number_of_mins= ENV['n'].to_i || 60
		puts "pruning urls from #{number_of_mins} minutes ago"
		ShortenedUrl.prune(number_of_mins)
		end
	end
