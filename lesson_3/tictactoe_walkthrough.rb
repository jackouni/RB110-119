require 'pry-byebug'

EMPTY_MARKER = ' '
USER_MARKER = 'X'
COMP_MARKER = 'O'
WINNING_LINES = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
]

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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = EMPTY_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == EMPTY_MARKER }
end

def player_places_piece!(board)
  square = ''
  empty = empty_squares(board)

  loop do
    prompt "Choose a square: #{joinor(empty, ', ', 'and')}"
    square = gets.chomp.to_i
    break if empty.include?(square)
    prompt "Please enter a valid input."
  end

  board[square] = USER_MARKER
end

def comp_places_piece!(board)
  selected_square = nil
  
  WINNING_LINES.each do |line|  # Offense
    selected_square = at_risk_squares(line, COMP_MARKER, board)
    if selected_square
      break
    end 
  end
  
  if !selected_square
    WINNING_LINES.each do |line| # Defense
      selected_square = at_risk_squares(line, USER_MARKER, board)
      if selected_square
        break
      end
    end
  end  

  if !selected_square            # Pick at random
    if board[5] == EMPTY_MARKER
      board[5] = COMP_MARKER
    else
      selected_square = empty_squares(board).sample
    end
  end 

  board[selected_square] = COMP_MARKER
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  winner = nil

  WINNING_LINES.each do |line|
    if line.all? { |square| board[square] == USER_MARKER }
      winner = 'User'
      break
    end

    if line.all? { |square| board[square] == COMP_MARKER }
      winner = 'Computer'
      break
    end
  end

  winner
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr[0].to_s
  when 2 then arr.join(" #{word} ")
  else
    first_elements = arr[0, arr.size - 1].join(delimiter)
    "#{first_elements} #{word} #{arr.last}"
  end 
end

def display_scores(user_score, comp_score)
  puts "User Wins: #{user_score} | Computer Wins: #{comp_score}"
end

def at_risk_squares(line, marker, board)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == EMPTY_MARKER }.keys.sample
  else
    nil
  end 
end 

def play_piece!(board, player)
  player ? player_places_piece!(board) : comp_places_piece!(board) 
end

user_turn = nil
user_score = 0
comp_score = 0

loop do # Main Game Loop
  board = initialize_board 
  who_chooses = ['user', 'computer'].sample

  if who_chooses == 'user'
    loop do
      prompt "You choose who goes 1st? (user/computer):"
      user_input = gets.chomp.downcase
      
      if user_input == 'user'
        prompt "You go first!"
        user_turn = true
        break
      elsif user_input == 'computer' 
        prompt "Computer goes first!"
        user_turn = false
        break
      else 
        prompt "Please enter a valid input!! Type 'user' or 'computer'..."
      end 
    end 
  else
    prompt "The computer is choosing who goes first..."
    user_turn = [true, false].sample
    sleep(1.5)
    prompt "The computer chooses #{user_turn ? 'you' : 'itself'} to go first."
    sleep(2.5)
  end 
   

  loop do # Round Loop
    display_board(board)
    display_scores(user_score, comp_score)
    play_piece!(board, user_turn)
    user_turn ? user_turn = false : user_turn = true
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    user_score += 1 if detect_winner(board) == 'User'
    comp_score += 1 if detect_winner(board) == 'Computer'
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y/n):"
  answer = gets.chomp
  break if answer == 'n' || answer == 'N'
end

prompt "Thanks for playing TicTacToe, goodbye!"
