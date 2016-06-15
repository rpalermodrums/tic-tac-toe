class SetPlayerName
  attr_reader :human_player
  
  def initialize(human_player)
    @human_player = human_player
  end
  
  def run
    puts "What is your name?"
    human_player.name = gets.chomp.capitalize
  end
end