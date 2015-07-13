def is_legal(card)
  if card.color == $deck.live_pile[0].color or card.number == $deck.live_pile[0].number or $deck.live_pile[0].number == "wild" or $deck.live_pile[0].number == "draw4"
    return true
  else
    return false
  end
end

def draw_hand()
  puts "The current card is #{$deck.live_pile[0].color.capitalize} #{$deck.live_pile[0].number}"
  puts "Your hand is:"
  number = 1
  $playerhand.each do |card|
    print number.to_s + ". " + card.color.capitalize + " " + card.number.to_s + ", "
    number += 1
  end
  puts
end

def draw_card_from_hand(card, hand)
  $discardpile.push($deck.live_pile[0])
  $deck.live_pile[0] = card
  hand.delete(card)
end

puts "Welcome to UNO!"

$playerhand = []
$discardpile = []
$opponent = Opponent.new

$deck.draw($playerhand, 7)
$deck.draw($opponent.hand, 7)

$deck.draw($deck.live_pile, 1)

#loop do
loop do
  card = nil
  loop do
    draw_hand()

    print "Pick a card number or type 'draw': "
    response = gets.chomp
    if response.downcase == "draw"
      $deck.draw($playerhand, 1)
    else
      card = $playerhand[response.to_i - 1]
      puts "You picked #{card.color.capitalize} #{card.number}!"
      if is_legal(card)
        break
      else
        puts "Nice try, but that's invalid.".red
      end
    end
  end

  $deck.live_pile_add($playerhand, card)
  
  $opponent.do_move()
  
  puts "Your opponent has #{$opponent.hand.length} cards."
end