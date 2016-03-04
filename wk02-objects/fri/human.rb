class Human
  def choose_piece
    puts "Would you like to be 'X' or 'O'?"
    choice = gets.chomp.upcase
    until ["X", "O"].include?(choice)
      puts "Please only choose X or O."
      choice = gets.chomp.upcase
    end
    @piece = choice
  end

  def piece
    @piece
  end

  def make_move
    gets.chomp.to_i
  end
end

### object.method
