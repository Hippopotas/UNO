require "colorize"

require_relative "./UNOclass"

$deck = Deck.new
$currentHand = $deck.draw

class Opponent
  attr_accessor :hand
  def do_move
    
  end
end

require_relative "./UNOinterface"