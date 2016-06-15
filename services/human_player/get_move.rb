class GetMove
  attr_reader :human_player
  
  def initialize(human_player)
    @human_player = human_player
  end
  
  def run
    puts "Choose a space(a1-c3)"
    gets.chomp
    RedirectHumanMove(human_player).run
  end
end