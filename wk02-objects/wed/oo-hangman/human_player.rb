class HumanPlayer < Player
  def make_guess
    gets.chomp.to_i
  end

  def to_s
    "#{@name}"
  end
end
