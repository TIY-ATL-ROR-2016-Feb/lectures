require "pry"

class Card
  include Comparable

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    self.rank <=> other_card.rank
  end

  def rank
    @rank
  end

  def suit
    @suit
  end

  def to_s
    "The #{rank} of #{suit}"
  end
end


class Deck
  include Enumerable

  def each
    ## ?
  end
end

binding.pry
