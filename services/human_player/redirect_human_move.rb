class RedirectHumanMove
  attr_reader :human_player
  
  def initialize(human_player)
    @human_player = human_player
  end
  
  
  def run
    puts "Not a valid space"
    TakeTurn.new(human_player).run
  end
end