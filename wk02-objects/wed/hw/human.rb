class Human
  def initialize(name)
    # @coffee = coffee
    @alertness = 0.0
    @name = name
  end

  def alertness
    @alertness
  end

  def has_coffee?
    @coffee != nil
  end

  def needs_coffee?
    @coffee.nil?
  end

  def wake_up(coffee)
    self.buy(coffee)
    self.drink!(coffee)
  end

  def buy(coffee)
    @coffee = coffee
  end

  def drink!
    @coffee.sip
    @alertness += 0.33
  end
end
