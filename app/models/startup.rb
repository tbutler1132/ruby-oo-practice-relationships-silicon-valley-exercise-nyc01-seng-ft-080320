class Startup

    attr_reader :founder, :name, :domain
    @@all = []
    
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end 

    def pivot=(domain, name)
        @domain = domain
        @name = name
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end
    
    def funding_rounds
        FundingRound.all.select do |rounds|
            rounds.startup == self
        end 
    end 

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.map do |round|
            round.investment
        end.sum
    end

    def startup_investors
        funding_rounds.map do |round|
            round.venture_capitalist
        end.uniq
    end 
    
    def self.all
        @@all
    end 

end
