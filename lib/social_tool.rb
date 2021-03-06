module SocialTool
  def self.twitter_search
      client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET_KEY")
      config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("TWITTER_SECRET_ACCESSS_TOKEN")
    end

    client.search('#rails', result_type: 'recent').take(9).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end