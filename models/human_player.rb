
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
  end

  def self.leaderboard
    @@leaderboard
  end

  def create_leaderboard
    @@leaderboard[@name] = @wins
  end

  def add_win
    @wins += 1
    self.create_leaderboard
  end

  def valid?(move)
    SPACES.keys.include?(move.to_sym)
  end
end
