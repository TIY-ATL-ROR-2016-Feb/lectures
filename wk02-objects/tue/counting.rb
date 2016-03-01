class CountingPlayer
  def initialize
    @count = 0
  end

  def get_guess(max)
    if @count > max
      @count = 0
    end
    @count += 1
  end
end
