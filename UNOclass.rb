class Card
  def initialize(color,number)
    @color = color
    @number = number
    @card = [color,number]
  end
  
  attr_accessor :color
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
      @colors.each do |color|
        1.upto(9) do |number|
          @deck = @deck.push(Card.new(color,number))
        end
        @deck = @deck.push(Card.new(color,"draw2"))
      end
    end
    @colors.each do |color|
      @deck = @deck.push(Card.new(color,"0"))
    end
    1.upto(4) do |number1|
      @deck = @deck.push(Card.new("wild","wild")) #wilds
      @deck = @deck.push(Card.new("wild", "draw4")) #wild draws
    end
    @live_pile = Array.new
    self.draw(@live_pile,1)
    
    @discard = Array.new
  end
    
  def draw(destination,number)
    if @deck.length < number
      self.shuffle
    end
      drawn_cards = @deck.sample(number)
      @deck = @deck - drawn_cards
      drawn_cards.each do |card|
        destination.push(card)
      end
  end
  
  def start_game
    loop do
      draw(@live_pile,1)
      if @live_pile.first.card(1).to_s == @live_pile.first.card(1)
        @deck.push(@live_pile.first)
        @live_pile = Array.new
      else
        break
      end
    end
  end
  
  def shuffle
    @discard.each do |card|
      @deck.push(card)
    end
    @discard = Array.new
  end
  
  def live_pile
    @live_pile
  end
  
  def discard
    @discard
  end
  
  def live_pile_add(origin,card)
    if origin.include?(card)
      if is_legal(card)
        origin.delete(card)
        @discard.push(@live_pile.first)
        @live_pile = Array.new
        @live_pile.push(card)
      else
        puts "You cannot play that card."
      end
    else
      puts "That card is not in your hand."
    end
  end
end