require "pry"

class Board
  attr_accessor :grid

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

  WINNING_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]


  def empty?(pos)
    #check if a space is empty with its index
    @grid[pos].nil?
  end

  def place_mark(pos, mark)
    #if a space is empty mark the space. otherwise, tell the player and retry
    empty?(pos) ? @grid[pos] = mark : redirect_place_mark(mark)
  end

  def redirect_place_mark(mark)
    puts "Not a valid move. Try Again."
    position = gets.chomp
    place_mark(SPACES[position.to_sym], mark)
  end

  def full?
    #check if the board is full
    @grid.none? { |space| space.nil? }
  end

  def won
    #iterate through each combination of wins, check if any of them has been achieved
    WINNING_COMBINATIONS.each do |combination|
      [:X, :O].each do |mark|
        return combination.all? { |space| @grid[space] == mark } ? mark : nil
      end
    end
  end

  def over?
    #check if the game is over if won has a value or board is full
    won || full?
  end

  def clear
    #reset board
    @grid = Array.new(9)
  end
end

# board = Board.new
# board.place_mark(0, :X)
