class Coffee
  def initialize(name)
    @amount = 3
  end

  def full?
    @amount == 3
  end

  def empty?
    @amount.zero?
  end

  def sip
    @amount -= 1
  end
end
