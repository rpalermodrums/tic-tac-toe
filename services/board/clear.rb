class Clear
  attr_reader :board
  
  def initialize(board)
    @board = board
  end
  
  def run
    board.grid = Array.new(9)
  end
end