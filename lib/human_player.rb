require "pry"
class HumanPlayer
  attr_accessor :name, :mark, :space, :wins
  @@leaderboard = {}

  #make spaces more human-friendly to access via a hash
  SPACES ={
    a1: 0,
    b1: 1,
    c1: 2,
    a2: 3,
    b2: 4,
    c2: 5,
    a3: 6,
    b3: 7,
    c3: 8
  }

  def initialize
    @wins = 0
    @name = get_player_name
    @mark = get_player_mark
  end

  def self.leaderboard
    @@leaderboard
  end

  def create_leaderboard
    @@leaderboard[@name] = @wins
  end

  def get_player_name
    puts "What is your name?"
    gets.chomp
  end

  def get_player_mark
    puts "Choose X or O"
    gets.chomp.upcase.to_sym
  end

  def add_win
    @wins += 1
    self.create_leaderboard
  end

  def valid?(move)
    SPACES.keys.include?(move.to_sym)
  end

  def get_move
    puts "Choose a space(a1-c3)"
    gets.chomp
  end

  def redirect_human_move
    puts "Not a valid space"
    take_turn
  end

  def check_move(move)
    if valid?(move)
      # access real value/index of space
      @space = SPACES[move.to_sym]
    else
      # raise error and restart method if not valid
      redirect_human_move
    end
  end

  def take_turn
    #prompt user for a space
    move = get_move
    #check if move is valid
    check_move(move)
  end
end
