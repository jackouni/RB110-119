require 'pry'

def valid_input?(input)
  if input != input.to_i.to_s
    false
  elsif input.to_i > 0 && input.to_i < 4
    true
  else 
    false
  end 
end 

def valid_position?(coordinate, board)
  row = coordinate[0]
  col = coordinate[1]

  board[row][col] == '*'
end 

def win?(board, marker)
  is_win = false
  WIN_POSITIONS.each do |coordinates|
    mark_counter = 0 
    coordinates.each do |coordinate|
      row = coordinate[0]
      col = coordinate[1]
      
      mark_counter += 1 if board[row][col] == marker 
    end 

    if mark_counter == 3
      is_win = true
      break
    end 
  end 

  is_win 
end 

def display_winner(winner)
  case winner
  when 'user'
    puts "Congratulations! You won!!"
  when 'comp'
    puts "Shucks. Computer beat you this time!"
  else
    puts 'Error'
  end 
end 

def users_move(board)
  puts "Place your marker!"
  user_row = nil
  user_col = nil
  coordinate = []

  loop do   # Validating marker position

    loop do # Getting the row position
      puts "Pick a row number between 1 and 3:"
      user_row = gets.chomp
      break if valid_input?(user_row)
      puts "Please enter a valid input!!"
    end 

    loop do # Getting the column position
      puts "Pick a column number between 1 and 3:"
      user_col = gets.chomp
      break if valid_input?(user_col)
      puts "Please enter a valid input!!"
    end

    row = user_row.to_i - 1
    col = user_col.to_i - 1
    coordinate = [row, col]

    break if valid_position?(coordinate, board)
    puts "Sorry, that position has already been marked!!"
    puts "Please enter your coordinates again!!"
  end 

  coordinate
end 

def computers_move(board)
  coordinate = []

  loop do
    comp_row = rand(0..2)
    comp_col = rand(0..2)
    coordinate = [comp_row, comp_col]
    break if valid_position?(coordinate, board)
  end 

  coordinate
end

def display_board(board)
  puts "CURRENT BOARD"
  puts "-------------"
  board.each do |row|
    puts "| #{row[0]} | #{row[1]} | #{row[2]} |"
  end 
  puts "-------------"
end 

def update_board(coordinate, whos_turn, board)
  row = coordinate[0]
  col = coordinate[1]

  if whos_turn == 'user'
    board[row][col] = 'X'
  else 
    board[row][col] = 'O'
  end 
end 

# --------------------------

puts "Welcome to tictactoe!"

board = [
  ['*', '*', '*'],
  ['*', '*', '*'],
  ['*', '*', '*']
]

WIN_POSITIONS = [
  [[0,0], [0,1], [0,2]],
  [[1,0], [1,1], [1,2]],
  [[2,0], [2,1], [2,2]],
  [[0,0], [1,0], [2,0]],
  [[0,1], [1,1], [2,1]],
  [[0,2], [1,2], [2,2]],
  [[0,1], [1,1], [2,2]],
  [[0,2], [1,1], [2,0]]
]

loop do
  user_mark = users_move(board)
  update_board(user_mark, 'user', board)
  if win?(board, 'X')
    display_winner('user')
    break
  end 
  
  comp_mark = computers_move(board)
  update_board(comp_mark, 'computer', board)
  if win?(board, 'O')
    display_winner('comp')
    break
  end
  display_board(board)
end 

