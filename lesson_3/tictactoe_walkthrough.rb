require 'pry'

EMPTY_MARKER = ' '
USER_MARKER = 'X'
COMP_MARKER = 'O'

def prompt(message)
  puts "=> #{message}"
end 

def display_board(board)
  puts "      |      |     "
  puts "  #{board[1]}   |  #{board[2]}   |  #{board[3]}  "
  puts "      |      |     "
  puts "------+------+------"
  puts "      |      |     "
  puts "  #{board[4]}   |  #{board[5]}   |  #{board[6]}  "
  puts "      |      |     "
  puts "------+------+------"
  puts "      |      |     "
  puts "  #{board[7]}   |  #{board[8]}   |  #{board[9]}  "
  puts "      |      |     "
end 

def intialize_board 
  new_board = {}
  (1..9).each {|num| new_board[num] = EMPTY_MARKER}
  new_board
end 

def empty_squares(board)
  binding.pry
  board.keys.select {|num| board[num] == EMPTY_MARKER}
end

def player_places_piece!(board)
  square = ''
  empty = empty_squares(board)

  loop do
    prompt "Choose a square (#{empty.join(', ')})"
    square = gets.chomp.to_i
    break if empty.include?(square)
    prompt "Please enter a valid input."
  end
  
  board[square] = USER_MARKER 
end 

board = intialize_board
display_board(board)

player_places_piece!(board)
puts board.inspect
display_board(board)