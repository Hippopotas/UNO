puts "Welcome to online UNO!"
puts "Press any key to start"
input = gets.chomp

loop do
puts "Your hand is "
end

class Game
  @@deck = Deck.new
  @@currentCard = nil
  def self.deck
    @@deck
  end
  def self.currentCard
    @@currentCard
  end
  def initialize()
    self.currentCard = self.deck.draw
  end
end

class Opponent
  attr_accessor :hand
  def do_move
    
  end
end