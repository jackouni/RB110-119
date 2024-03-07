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

#########

def deal_card(deck, player)
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

def display_dealer_hand(dealers_hand)
  puts "Dealer has: #{dealers_hand[0]} and unknown card"
end

def display_user_hand(users_hand)
  puts "You have: #{joinor(users_hand, ', ', 'and')}"
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

def updated_total(player)
  player[:score] = 0 
  player[:hand].each { |card| player[:score] += get_card_value(player, card) }
end 

###

deck = initialize_deck()
winner = nil

user = {
  hand: [],
  score: 0
}

dealer = {
  hand: [],
  score: 0
}

2.times do
  deal_card(deck, user)
  deal_card(deck, dealer)
end 

loop do 
  display_dealer_hand(dealer[:hand])
  display_user_hand(user[:hand])
  updated_total(user)

  break if user[:score] > 21 

  prompt "Your points: #{user[:score]}"
  prompt "Do you want to \"hit\" or \"stay\"?"
  user_choice = gets.chomp
  if user_choice == 'hit'
    deal_card(deck, user)
  elsif user_choice == 'stay'
    break
  else
    prompt "Please input a valid answer!! (Type: 'hit' or 'stay')"
    puts ""
  end 
end

if user[:score] > 21
  # winner = 'dealer'
  # break main game loop??
end