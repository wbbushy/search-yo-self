require 'twitter'


client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "p3v6n2DOouySLSWtubbrtwITs"
    config.consumer_secret     = "KF6FzH6bwN3OmSOpYfEZoVYjuAdMEbA56bW1iWtKxH7etSP80t"
    config.access_token        = "55049642-IwoX5n3YpI9IvevdOvX5XLMJaI8BtKhxtBc3QtJlI"
    config.access_token_secret = "yPqoQGSvn6HexNIEK3Ky8zYJccOc8ouB1o8lExC8lKH4t"
end

p client.friends("rubberyuzu").take(5)
