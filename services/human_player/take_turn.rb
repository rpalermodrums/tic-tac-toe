class TakeTurn
  attr_reader :human_player
  
  def initialize(human_player)
    @human_player = human_player
  end
  
  def run
    move = GetMove.new(human_player).run
    CheckMove.new(human_player).run(move, human_player)
  end
end