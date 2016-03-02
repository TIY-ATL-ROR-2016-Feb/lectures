class RandomPlayer
  def initialize(name="The Nameless One")
    @name = name
  end

  def make_guess
    ("a".."z").to_a.sample
  end
end
