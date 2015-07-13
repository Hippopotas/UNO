puts "Welcome to UNO!"

$playerhand = []
$opponent = Opponent.new

$deck.draw($playerhand, 7)

#loop do
puts "Your hand is:"
number = 1
$playerhand.each do |card|
  print number.to_s + ". " + card.color.capitalize + " " + card.number.to_s + ", "
  number += 1
end
puts
print "Pick a card number: "
card = $playerhand[gets.chomp.to_i - 1]
puts "You picked #{card.color.capitalize} #{card.number}!"
#end