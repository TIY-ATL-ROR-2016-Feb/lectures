require "pry"

board = [1,2,3,4,5,6,7,8,9]

WINS = [[1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
       ]

## DATA IN THE SYSTEM
# * board
# * player1 (name/piece), player2
# * win conditions
# * current_player => player1, player2

# board = {
#   1 => 1,
#   2 => 2,
#   3 => 3
# }

# board[0][1]
# board[1][2]

def show_board(board)
  3.times do |row|
    puts board[row * 3, 3].join(" | ")
  end
end

def display_board(board)
  puts "
    #{board[0]} | #{board[1]} | #{board[2]}
    #{board[3]} | #{board[4]} | #{board[5]}
    #{board[6]} | #{board[7]} | #{board[8]}
    "
end



binding.pry
