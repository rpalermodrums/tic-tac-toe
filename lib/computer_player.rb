require "pry"

class ComputerPlayer
  attr_accessor :mark, :space

  #list all winning combos in an array
  WINNING_COMBINATIONS = [
    [0,1,2],
    [2,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def take_turn(board)
    #find a winning move if there is one
    winning_combo = WINNING_COMBINATIONS.find do |combo|
      board[combo[0]] == mark && board[combo[1]] == mark && board[combo[2]].nil?
    end
    #if there is no winning move, pick a random empty space
    if winning_combo.nil?
      available_spaces = []
      board.each_with_index do |s, i|
        available_spaces << i if s.nil?
      end
      @space = available_spaces.sample
    else
      #otherwise pick the winning move
      @space = winning_combo[2]
    end
  end
end
