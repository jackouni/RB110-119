require 'pry'

EMPTY_MARKER = ' '
USER_MARKER = 'X'
COMP_MARKER = 'O'

def prompt(message)
  puts "=> #{message}"
end 

def display_board(board)
  system 'clear'
  puts "You are #{USER_MARKER}'s | Computer is #{COMP_MARKER}'s"
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
  puts " "
end 

def intialize_board 
  new_board = {}
  (1..9).each {|num| new_board[num] = EMPTY_MARKER}
  new_board
end 

def empty_squares(board)
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

def comp_places_piece!(board)
  square = empty_squares(board).sample
  board[square] = COMP_MARKER
end 

def board_full?(board)
  empty_squares(board).empty?
end 

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  winning_lines = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7],
  ]

  winner = nil

  winning_lines.each do |line|
    if line.all? { |square| board[square] == USER_MARKER }
      winner = 'User' 
      break
    end 
  end 

  winning_lines.each do |line|
    if line.all? { |square| board[square] == COMP_MARKER }
      winner = 'Computer' 
      break
    end 
  end 

  winner
end

loop do # Main Game Loop
  board = intialize_board

  loop do # Round Loop
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    comp_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end 

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end 

  prompt "Play again? (y/n):"
  answer = gets.chomp
  break if answer == 'n' || answer == 'N'
end 

prompt "Thanks for playing TicTacToe, goodbye!"