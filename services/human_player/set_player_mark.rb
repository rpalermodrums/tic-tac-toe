class SetPlayerMark
  attr_reader :human_player
  
  def initialize(human_player)
    @human_player = human_player
  end
  
  def run
    puts "Choose X or O"
    human_player.mark = gets.chomp.upcase.to_sym
  end
end