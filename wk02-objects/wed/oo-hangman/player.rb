class Player
  def initialize(name="The Nameless One")
    @name = name
  end

  def to_s
    "#<Player: #{@name}>"
  end
end
