require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

facebook = Startup.new("Facebook", "Mark Zuckerberg", "Facebook.com")
amazon = Startup.new("Amazon", "Jeff Bezos", "Amazon.com")
apple = Startup.new("Apple", "Steve Jobs", "Apple.com")

peter_thiel = VentureCapitalist.new("Peter Thiel", 5000000)
elon_musk = VentureCapitalist.new("Elon Musk", 4500000)

series_a_facebook = FundingRound.new(facebook, elon_musk, "Series A", 3000)
series_b_facebook = FundingRound.new(facebook, peter_thiel, "Series B", 10000)
series_c_facebook = FundingRound.new(facebook, peter_thiel, "Series C", 50000)

series_a_apple = FundingRound.new(apple, peter_thiel, "Series C", 220000)

angel_amazon = amazon.sign_contract(elon_musk, "Angel", "63635")



binding.pry
0 #leave this here to ensure binding.pry isn't the last line