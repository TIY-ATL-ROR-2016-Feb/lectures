require "pry"

WINS = [[1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]]

def greeting
  puts
  puts "Welcome to Tic Tac Toe!"
  puts "Try to get three in a row to win..."
  puts
end

def show_board(board)
  puts "
    -----------
   | #{board[0]} | #{board[1]} | #{board[2]} |
   | #{board[3]} | #{board[4]} | #{board[5]} |
   | #{board[6]} | #{board[7]} | #{board[8]} |
    -----------

"
end

def choose_player
  puts "Would you like to be 'X' or 'O'?"
  choice = gets.chomp.upcase
  until ["X", "O"].include?(choice)
    puts "Sorry. You have to choose 'X' or 'O'?"
    choice = gets.chomp
  end
  choice
end

def switch_player(player)
  player == "X" ? "O" : "X"
end

# def uniq_win?(board)
#   WINS.any? do |win|
#     result = []
#     win.each do |space|
#       result.push(board[space - 1])
#     end
#     result.uniq.length == 1
#   end
# end

# def final_win?(board)
#   WINS.any? do |win|
#     pieces = win.map { |space| board[space - 1] }
#     pieces.uniq.length == 1
#   end
# end
#
# def win?(board)
#   WINS.each do |win|
#     piece1 = board[win[0] - 1]
#     piece2 = board[win[1] - 1]
#     piece3 = board[win[2] - 1]
#     if piece1 == piece2 && piece2 == piece3
#       return true
#     end
#   end
# end

# def better_win?(board)
#   WINS.any? do |win|
#     piece1 = board[win[0] - 1]
#     piece2 = board[win[1] - 1]
#     piece3 = board[win[2] - 1]
#     piece1 == piece2 && piece2 == piece3
#   end
# end

def win?(board)
  WINS.any? do |x, y, z|
    board[x - 1] == board[y - 1] && board[y - 1] == board[z - 1]
  end
end

def draw?(board)
  board.all? { |piece| piece.is_a?(String) }
end

def game_over?(board)
  win?(board) || draw?(board)
end

def available_moves(board)
  board.select { |piece| piece.is_a?(Fixnum) }
end

def take_turn(board, player)
  show_board(board)
  puts "Player #{player}, please choose a space to move to. (1-9)"
  choice = gets.chomp.to_i
  until available_moves(board).include?(choice)
    puts "You have to choose an available board position. Please pick again."
    choice = gets.chomp.to_i
  end
  choice - 1
end

def tic_tac_toe
  board = (1..9).to_a
  current_player = choose_player
  greeting
  until game_over?(board)
    move = take_turn(board, current_player)
    board[move] = current_player
    current_player = switch_player(current_player) unless game_over?(board)
  end
  finito(current_player, board)
end

def finito(player, board)
  if win?(board)
    puts "You're awesome #{player}."
  elsif draw?(board)
    puts "At least you didn't lose."
  else
    puts "You really need to work on that."
  end
end

tic_tac_toe
