TEN_POINTS = ['queen', 'king', 'jack']
FACE_VALUES = (1..10)

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = []
  4.times do
    deck << (1..10).to_a
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

def get_ace_value(players_total)
  players_total <= 10 ? 11 : 1
end 

def get_card_value(player, card)
  if FACE_VALUES.include? card 
    card
  elsif TEN_POINTS.include? card
    10
  else
    get_ace_value(player[:score])
  end
end 

def update_score(player)
  player[:score] = 0 
  player[:hand].each { |card| player[:score] += get_card_value(player, card) }
end 

def bust?(player)
  player[:score] > 21 ? true : false 
end

def detect_winner(user, dealer)
  return 'user' if bust?(dealer)
  return 'dealer' if bust?(user)
  
  if user[:score] > dealer[:score]
    'user'
  elsif user[:score] < dealer[:score]
    'dealer'
  else
    'tie'
  end 
end

def user_turn(user, dealer, deck) # User turn: 'hit' or 'stay'
  loop do
    update_score(user)
    display_dealer_hand(dealer[:hand])
    display_user_hand(user[:hand])
    prompt "| Your points: #{user[:score]} |"
    
    if bust?(user) 
      system 'clear'
      prompt "You busted!"
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
      prompt "Please input a valid answer!! (Type: 'hit' or 'stay')"
      system 'clear'
    end 
  end 
end 

def dealer_turn(dealer, deck)
  loop do
    update_score(dealer)

    if bust?(dealer) 
      system 'clear'
      prompt "Dealer busted!"
      break
    end

    if dealer[:score] < 17
      deal_card!(deck, dealer)
    else
      break
    end 
  end 
end

### GAME BEGIN

deck = initialize_deck()

user = {
  hand: [],
  score: 0
}

dealer = {
  hand: [],
  score: 0
}

2.times do
  deal_card!(deck, user)
  deal_card!(deck, dealer)
end 

user_turn(user, dealer, deck)
dealer_turn(dealer, deck) unless bust?(user)
update_score(dealer)

reveal_dealer_hand(dealer[:hand])
display_user_hand(user[:hand])

prompt "| Your points: #{user[:score]} | Dealer's points: #{dealer[:score]}"

winner = detect_winner(user, dealer)

if winner == 'user'
  prompt "Congrats, you beat the dealer!"
elsif winner == 'dealer'
  prompt "The dealer beat you this time!"
else
  prompt "Tie game."
end
