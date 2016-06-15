class PlaceMark
  attr_accessor :pos, :mark, :board
  
  def initialize(pos, mark, board)
    @pos = pos
    @mark = mark
    @board = board
  end
  
  def run
    place_mark
  end
  
  def place_mark
    #if a space is empty mark the space. otherwise, tell the player and retry
    board.empty?(pos) ? board.grid[pos] = mark : redirect_place_mark(mark)
  end

  def redirect_place_mark
    puts "Not a valid move. Try Again."
    position = gets.chomp
    place_mark(SPACES[position.to_sym], mark)
  end 
end