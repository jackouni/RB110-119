TEN_POINTS = ['queen', 'king', 'jack']
FACE_VALUES = (2..10)

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

def display_user_hand(users_hand)
  puts "You have: #{joinor(users_hand, ', ', 'and')}"
  puts "------------------------------------------------"
end

def display_scores(user, dealer)
  puts "_____________________"
  puts "|USER   V.S   DEALER|"
  puts "  #{user[:score]}              #{dealer[:score]} "
end

### GAME MECHANICS:

def create_player
  { hand: [], points: 0, score: 0 }
end

def initialize_deck
  deck = []
  4.times do
    deck << (2..10).to_a
    deck << 'ace'
    deck << 'king'
    deck << 'queen'
    deck << 'jack'
  end

  deck.flatten
end

def deal_card!(deck, player)
  card_dealt = deck.sample

  player[:hand] << card_dealt

  deck.each_with_index do |card, index|
    if card == card_dealt
      deck.delete_at(index)
      break
    end
  end
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
  user_plays_again = false

  loop do
    prompt "Would you like to play again? ('y' / 'n'):"
    user_choice = gets.chomp.downcase

    case user_choice
    when 'y'
      user_plays_again = true
      break
    when 'n'
      break
    else
      system 'clear'
      prompt "Please select a valid input!!"
    end
  end

  user_plays_again
end

def increment_score(player)
  player[:score] += 1
end

def reset_hand(player)
  player[:hand] = []
end

### USER & DEALER TURNS:

def user_turn(user, dealer, deck)
  loop do
    update_points!(user)
    display_scores(user, dealer)
    display_dealer_hand(dealer[:hand])
    display_user_hand(user[:hand])

    prompt "| Your points: #{user[:points]} |"

    if bust?(user)
      system 'clear'
      prompt "User busts!"
      break
    end

    prompt "Do you want to \"hit\" or \"stay\"?"
    user_choice = gets.chomp

    if user_choice == 'hit'
      system 'clear'
      deal_card!(deck, user)
    elsif user_choice == 'stay'
      system 'clear'
      break
    else
      system 'clear'
      prompt "Please input a valid answer!! (Type: 'hit' or 'stay')"
    end
  end
end

def dealer_turn(dealer, deck)
  loop do
    update_points!(dealer)

    if bust?(dealer)
      system 'clear'
      prompt "Dealer busts!"
      break
    end

    if dealer[:points] < 17
      deal_card!(deck, dealer)
    else
      break
    end
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
  reveal_dealer_hand(dealer[:hand])
  display_user_hand(user[:hand])

  ### ROUND CONCLUDES:

  prompt "| Your points: #{user[:points]} | Dealer's points: #{dealer[:points]}"

  winner = detect_winner(user, dealer)

  if winner == 'user'
    increment_score(user)
    prompt "Congrats, you beat the dealer!"
  elsif winner == 'dealer'
    increment_score(dealer)
    prompt "The dealer beat you this time!"
  else
    prompt "Tie game."
  end

  if play_again?
    reset_hand(user)
    reset_hand(dealer)
    deck = initialize_deck

    system 'clear'
    prompt "New game started!"
    sleep(1.5)
    system 'clear'
  else
    prompt "Thanks for playing. Goodbye."
    break
  end
end
