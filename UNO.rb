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