puts "Welcome to UNO!"

$playerhand = []
$opponent = Opponent.new

loop do
  puts "Your hand is "
  $playerhand = $deck.draw
  $playerhand.each do |card|
    print card.number + " " + card.color
  end
  puts
end