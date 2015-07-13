def is_legal(card)
  if card.color == $deck.live_pile[0].color or card.number == $deck.live_pile[0].number or card.number == "wild" or card.number == "draw4"
    return true
  else
    return false
  end
end

def is_wild(card)
  if card.number == "wild" or card.number == "draw4"
    return true
  else
    return false
  end
end

def draw_hand()
  colorize_color = nil
  if $deck.live_pile[0].color == "red"
    colorize_color = :red
  elsif $deck.live_pile[0].color == "green"
    colorize_color = :green
  elsif $deck.live_pile[0].color == "blue"
    colorize_color = :blue
  elsif $deck.live_pile[0].color == "yellow"
    colorize_color = :yellow
  end
  puts "The current card is " + ($deck.live_pile[0].color.capitalize + " " + $deck.live_pile[0].number.to_s).colorize(colorize_color)
  puts "Your hand is:"
  number = 1
  $playerhand.each do |card|
    colorize_color = nil
    if card.color == "red"
      colorize_color = :red
    elsif card.color == "green"
      colorize_color = :green
    elsif card.color == "blue"
      colorize_color = :blue
    elsif card.color == "yellow"
      colorize_color = :yellow
    end
    print (number.to_s + ". " + card.color.capitalize + " " + card.number.to_s).colorize(colorize_color) + ", "
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
        if is_wild(card)
          color = nil
          loop do
            print "Select a color (red, green, yellow, blue): "
            color = gets.chomp
            if color == "red" or color == "green" or color == "yellow" or color == "blue"
              break
            else
              puts "That's not a color!".red
            end
          end
          card.color = color
          break
        else
          break
        end
      else
        puts "Nice try, but that's invalid.".red
      end
    end
  end

  $deck.live_pile_add($playerhand, card)
  
  if $playerhand.length == 0
    puts "YOU WIN!".green
    break
  end
  
  $opponent.do_move()
  
  if $opponent.length == 0
    puts "YOU LOSE!".red
    break
  end
  
  puts "Your opponent has #{$opponent.hand.length} cards."
end