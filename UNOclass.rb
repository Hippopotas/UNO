class Card
  def initialize(color,number)
    @color = color
    @number = number
    @card = [color,number]
  end
  
  def color
    @color
  end
  def number
    @number
  end
  
  def card
    @card
  end
  
#  def type(type)
#    if type = "skip"
#      @number = type
#      @card = 
#    elsif type = "draw two"
#    elsif type = "reverse"
#    end
#  end
end

class Deck
  def initialize
    @deck = Array.new
    @colors = ["red","blue","yellow","green"]
    1.upto(2) do |number1|
      1.upto(9) do |number|
        @colors.each do |color|
          @deck = @deck.push(Card.new(color,number))
        end
      end
    end
    1.upto(4) do |number1|
      @deck = @deck.push(Card.new("wild","wild"))
    end
  end
    
  def draw(destination,number)
    drawn_cards = @deck.sample(number)
    @deck = @deck - drawn_cards
    drawn_cards.each do |card|
      destination.push(card)
    end
  end
end