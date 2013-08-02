require 'csv'
require 'twitter'
require_relative '../app/models/legislator.rb'
require_relative '../app/models/tweet.rb'

Twitter.configure do |config|
  config.consumer_key = "mdxMTLkoNYgLIyqPhNCaA"
  config.consumer_secret = "W8Kbo0ocCDGM1xk2bIiYPFYyMRxOkyZXYdxjW0188"
  config.oauth_token = "316272091-8AR8t1DLosnRWZOY3JVuL2OIL7jyHHvislzMJejP"
  config.oauth_token_secret = "RDzMJbwmL0UNlsinkiFpKmcjLtjw1KepPFnT9yIj7I"
end

class TweetImporter

  def self.get_tweets(twitter_id)
    Twitter.user_timeline("#{twitter_id}", {count: 10})
  end

  def self.import
    tweeting_pols = Legislator.where('twitter_id != ?', "")
    tweeting_pols.each do |pol|
      begin
        get_tweets(pol.twitter_id).each do |tweet|
          tweet_info = {identifier: tweet.id, text: tweet.text}
          tweet = Tweet.create!(tweet_info)
          tweet.legislator = pol
          tweet.save
        end
      rescue 
        next
      end
    end
  end
end



# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
