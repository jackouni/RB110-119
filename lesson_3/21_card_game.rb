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

def deal_card(deck, players_hand)
  card_dealt = deck.sample

  players_hand << card_dealt

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

def display_dealers_hand(dealers_hand)
  puts "Dealer has: #{dealers_hand[0]} and unknown card"
end

def display_users_hand(users_hand)
  puts "You have: #{joinor(users_hand, ', ', 'and')}"
end

def get_ace_value(players_total)
  players_total <= 10 ? 11 : 1
end 

def get_card_value(players_total, card)
  if FACE_VALUES.include? card 
    card
  elsif TEN_POINTS.include? card
    10
  else
    get_ace_value(players_total)
  end
end 

def updated_total(players_hand)
  sum = 0 
  players_hand.each { |card| sum += get_card_value(sum, card)}
  sum
end 

###

deck = initialize_deck
users_hand = []
user_total = 0
dealers_hand = []
dealer_total = 0

2.times do
  deal_card(deck, users_hand)
  deal_card(deck, dealers_hand)
end 

loop do
  display_dealers_hand(dealers_hand)
  display_users_hand(users_hand)
  user_total = updated_total(users_hand)

  break if user_total > 21 

  prompt "Your points: #{user_total}"
  prompt "Do you want to \"hit\" or \"stay\"?"
  user_choice = gets.chomp
  if user_choice == 'hit'
    deal_card(deck, users_hand)
  elsif user_choice == 'stay'
    break
  else
    prompt "Please input a valid answer!! (Type: 'hit' or 'stay')"
    puts ""
  end 
end 