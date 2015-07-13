require "colorize"

require_relative "./UNOclass"

$deck = Deck.new

class Opponent
  attr_accessor :hand
  def initialize
    self.hand = []
  end
  def do_move
    self.hand.each do |card|
      if is_legal(card)
        if is_wild(card)
          red = 0
          yellow = 0
          green = 0
          blue = 0
          self.hand.each do |check_card|
            if check_card.color == "red"
              red += 1
            elsif check_card.color == "yellow"
              yellow += 1
            elsif check_card.color == "green"
              green += 1
            elsif check_card.color == "blue"
              blue += 1
            end
          end
          if red > yellow and red > green and red > blue
            card.color = "red"
          elsif yellow > red and yellow > green and yellow > blue
            card.color = "yellow"
          elsif green > red and green > yellow and yellow > blue
            card.color = "green"
          elsif blue > red and blue > green and blue > yellow
            card.color = "blue"
          else
            card.color = "yellow"
          end
        end
        $deck.live_pile_add(self.hand, card)
        return
      end
    end
    while !is_legal(self.hand.last)
      $deck.draw(self.hand, 1)
    end
  end
end

require_relative "./UNOinterface"