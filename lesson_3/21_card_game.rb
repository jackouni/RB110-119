TEN_POINTS = ['queen', 'king', 'jack']
FACE_VALUES = (2..10).to_a

### DISPLAYS & OUTPUTS:

def prompt(msg)
  puts "=> #{msg}"
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

def reveal_dealer_hand(dealers_hand)
  puts "------------------------------------------------"
  puts "Dealer has: #{joinor(dealers_hand, ', ', 'and')}"
end

def display_dealer_hand(dealers_hand)
  puts "------------------------------------------------"
  puts "Dealer has: #{dealers_hand[0]} and unknown card"
end

def reveal_user_hand(users_hand)
  puts "You have: #{joinor(users_hand, ', ', 'and')}"
  puts "------------------------------------------------"
end

def display_points(player)
  prompt "| Your points: #{user[:points]} | Dealer's points: #{dealer[:points]}"
end

def display_scores(user, dealer)
  puts "_____________________"
  puts "|USER   V.S   DEALER|"
  puts "  #{user[:score]}              #{dealer[:score]} "
end

def round_display(user, dealer)
  display_scores(user, dealer)
  display_dealer_hand(dealer[:hand])
  reveal_user_hand(user[:hand])
end

def new_game_sequence
  system 'clear'
  prompt "New game started!"
  sleep(1.5)
  system 'clear'
end

def reveal_player_hands(user, dealer)
  reveal_dealer_hand(dealer[:hand])
  reveal_user_hand(user[:hand])
end

def end_of_round_output(winner, user, dealer)
  prompt "| Your points: #{user[:points]} | Dealer's points: #{dealer[:points]}"
  case winner
  when 'user' then prompt "Congrats, you beat the dealer!"
  when 'dealer' then prompt "The dealer beat you this time!"
  else prompt "Tie game."
  end
end

### GAME MECHANICS:

def create_player
  { hand: [], points: 0, score: 0 }
end

def initialize_deck
  deck = []
  4.times do
    deck << FACE_VALUES
    deck << 'ace'
    deck << 'king'
    deck << 'queen'
    deck << 'jack'
  end
  
  deck.flatten.shuffle
end

def deal_card!(deck, player)  
  player[:hand] << deck.pop
end

def get_ace_value(players_total)
  players_total <= 10 ? 11 : 1
end

def get_card_value(player, card)
  if FACE_VALUES.include? card
    card
  elsif TEN_POINTS.include? card
    10
  else
    get_ace_value(player[:points])
  end
end

def update_points!(player)
  player[:points] = 0
  player[:hand].each { |card| player[:points] += get_card_value(player, card) }
end

def bust?(player)
  player[:points] > 21
end

def player_hits?
  loop do
    prompt "Do you want to \"hit\" or \"stay\"?"
    user_choice = gets.chomp.downcase

    case user_choice
    when "hit" then return true
    when "stay" then return false
    else 
      prompt "Please input a valid answer!! (Type: 'hit' or 'stay')"
    end 
  end
end

def detect_winner(user, dealer)
  return 'user' if bust?(dealer)
  return 'dealer' if bust?(user)
  
  if user[:points] > dealer[:points]
    'user'
  elsif user[:points] < dealer[:points]
    'dealer'
  else
    'tie'
  end
end

def play_again?
  loop do
    prompt "Would you like to play again? ('y' / 'n'):"
    user_choice = gets.chomp.downcase

    case user_choice
    when 'y' then return true    
    when 'n' then return false
    else 
      system 'clear'
      prompt "Please select a valid input!!"
    end
  end
end

def update_score!(winner, user, dealer)
  case winner
  when 'user' then user[:score] += 1
  when 'dealer' then dealer[:score] += 1
  end
end

def reset_hand(player)
  player[:hand] = []
end

def reset_game(user, dealer, deck)
  reset_hand(user)
  reset_hand(dealer)
  deck = initialize_deck
end 

### USER & DEALER TURNS:

def user_turn(user, dealer, deck)
  loop do
    update_points!(user)
    round_display(user, dealer)

    prompt "| Your points: #{user[:points]} |"

    
    if bust?(user)
      system 'clear'
      prompt "User busts!"
      break
    end
    
    if player_hits?
      deal_card!(deck, user)
    else
      system 'clear'
      break
    end
    system 'clear'

  end
end

def dealer_turn(dealer, deck)
  loop do
    update_points!(dealer)

    if bust?(dealer)
      system 'clear'
      prompt "Dealer busts!"
      # break
    end

    break unless dealer[:points] < 17
    deal_card!(deck, dealer)
  end
end

### GAMEPLAY

deck = initialize_deck

user = create_player
dealer = create_player

loop do
  2.times do
    deal_card!(deck, user)
    deal_card!(deck, dealer)
  end

  user_turn(user, dealer, deck)
  dealer_turn(dealer, deck) unless bust?(user)

  update_points!(dealer)
  reveal_player_hands(user, dealer)

  ### ROUND CONCLUDES:
  
  winner = detect_winner(user, dealer)
  end_of_round_output(winner, user, dealer)
  update_score!(winner, user, dealer)

  break unless play_again?
  reset_game(user, dealer, deck)
end

prompt "Thanks for playing. Goodbye."
