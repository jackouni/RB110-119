require 'pry'

WIN_POSITIONS = [
  [[0,0], [0,1], [0,2]],
  [[1,0], [1,1], [1,2]],
  [[2,0], [2,1], [2,2]],
  [[0,0], [1,0], [2,0]],
  [[0,1], [1,1], [2,1]],
  [[0,2], [1,2], [2,2]],
  [[0,0], [1,1], [2,2]],
  [[0,2], [1,1], [2,0]]
]

def prompt(message)
  puts "=> #{message}"
end

def new_game
  prompt "Awesome, let's start a new game!"
end

def end_game
  prompt "No worries, goodbye."
end

def game_message(outcome)
  case outcome
  when 'user'
    prompt "Congratulations, you won!"
  when 'comp'
    prompt "Shucks, looks like the computer beat you this time."
  when 'tie' 
    prompt "It's a tie game."
  else
    puts "Error in game message sequence."
  end 
end 

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

def win?(board)
  is_win = false
  WIN_POSITIONS.each do |coordinates|
    mark_counter = 0 
    coordinates.each do |coordinate|
      row = coordinate[0]
      col = coordinate[1]
      
      mark_counter += 1 if board[row][col] != '*' 
    end 

    if mark_counter == 3
      is_win = true
      break
    end 
  end 

  is_win 
end 

def board_full?(board)
  is_empty = true

  board.each do |row|
    row.each do |column|
      if column == '*'
        is_empty = false
        break
      end
    end 
  end 

  is_empty
end

def display_winner(winner)
  case winner
  when 'user'
    prompt "Congratulations! You won!!"
  when 'comp'
    prompt "Shucks. Computer beat you this time!"
  else
    prompt 'Error'
  end 
end 

def display_tie
  prompt "Tie game!"
end 

def users_move(board)
  prompt "Place your marker!"
  user_row = nil
  user_col = nil
  coordinate = []

  loop do   # Validating marker position

    loop do # Getting the row position
      prompt "Pick a row number between 1 and 3:"
      user_row = gets.chomp
      break if valid_input?(user_row)
      prompt "Please enter a valid input!!"
    end 

    loop do # Getting the column position
      prompt "Pick a column number between 1 and 3:"
      user_col = gets.chomp
      break if valid_input?(user_col)
      prompt "Please enter a valid input!!"
    end

    row = user_row.to_i - 1
    col = user_col.to_i - 1
    coordinate = [row, col]

    break if valid_position?(coordinate, board)
    prompt "Sorry, that position has already been marked!!"
    prompt "Please enter your coordinates again!!"
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

def play_again?()
  play_again = true
  loop do
    prompt "Would you like to play again? ('y' or 'n'):"
    user_input = gets.chomp

    if user_input == 'n'
      play_again = false
      break
    elsif user_input == 'y'
      break
    else 
      prompt "Please enter a valid input. Either 'y' for 'yes' or 'n' for 'no'."
    end 
  end 

  play_again
end 

def display_board(board)
  puts "CURRENT BOARD"
  puts "-------------"
  board.each do |row|
    puts "| #{row[0]} | #{row[1]} | #{row[2]} |"
  end 
  puts "-------------"
end 

def update_board(coordinate, marker, board)
  row = coordinate[0]
  col = coordinate[1]

  if marker == 'X'
    board[row][col] = 'X'
  else 
    board[row][col] = 'O'
  end 
end 

def reset_board(board)
  board.map! do |row|
    row.map! {|col| '*'}
  end 
end 

# -----------------------------

prompt "Welcome to tictactoe!"

board = [
  ['*', '*', '*'],
  ['*', '*', '*'],
  ['*', '*', '*']
]

outcome = nil
loop do
  user_mark = users_move(board)        # User makes a move
  update_board(user_mark, 'X', board)

  if win?(board)                       # Player wins
    outcome = 'user'
    display_board(board)
    game_message(outcome)

    if play_again?()
      reset_board(board)
      outcome = nil
      new_game()
      next
    else
      end_game()
      break
    end 
  end 

  comp_mark = computers_move(board)   # Comp makes a move
  update_board(comp_mark, 'O', board)

  if win?(board)                      # Comp wins
    outcome = 'comp'
    display_board(board)
    game_message(outcome)

    if play_again?()
      reset_board(board)
      outcome = nil
      new_game()
      next
    else
      end_game()
      break
    end 

  elsif board_full?(board)             # No wins and board is full
    outcome = 'tie'
    display_board(board)
    game_message(outcome)

    if play_again?()
      reset_board(board)
      outcome = nil
      new_game()
      next
    else
      end_game()
      break
    end  
    
  else                                 # No wins, next round
    display_board(board)
    next
  end  

end  

