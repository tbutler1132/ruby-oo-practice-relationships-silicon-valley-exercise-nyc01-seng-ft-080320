class VentureCapitalist

    attr_accessor :name, :total_worth 
    @@all = []
    
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def funding_rounds
        FundingRound.all.select do |rounds|
            rounds.venture_capitalist == self
        end 
    end

    def portfolio
        funding_rounds.map do |round|
            round.startup
        end.uniq
    end
    
    def biggest_investment
        funding_rounds.map do |round|
            round.investment 
        end.max
    end 

    def invested(domain)
        domain_invested_in = funding_rounds.filter do |round|
            round.startup.domain == domain
        end
        domain_invested_in.map do |round|
            round.investment
        end.sum
    end

        
    
    def self.all
        @@all
    end 

end
