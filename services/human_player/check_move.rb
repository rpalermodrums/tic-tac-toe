def CheckMove
  attr_reader :move, :human_player
  
  def initialize(move, human_player)
    @human_player = human_player
  end
  
  def run
    if valid?(move)
      # access real value/index of space
      @space = SPACES[move.to_sym]
    else
      # raise error and restart method if not valid
      RedirectHumanMove.new(human_player).run
    end
  end
end