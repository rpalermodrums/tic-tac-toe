
class ComputerPlayer
  attr_accessor :mark, :space

  #list all winning combos in an array
  WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
    [1, 2, 0],
    [4, 5, 3],
    [7, 8, 6],
    [3, 6, 0],
    [4, 7, 1],
    [5, 8, 2],
    [4, 8, 0],
    [4, 6, 2],
    [2, 0, 1],
    [5, 3, 4],
    [8, 6, 7],
    [6, 0, 3],
    [7, 1, 4],
    [8, 2, 5],
    [8, 0, 4],
    [6, 2, 4]
  ]

  def winning_combo(player, board)
    WINNING_COMBINATIONS.find do |combo|
      board[combo[0]] == player && board[combo[1]] == player && board[combo[2]].nil?
    end
  end

  def computer_winning_combo(board)
    winning_combo(@mark, board)
    #find a winning set of moves if there is one
  end

  def human_mark
    @mark == :X ? :O : :X
  end

  def human_winning_combo(board)
    #find a winning set of moves for human if there is one
    winning_combo(human_mark, board)
  end

  def smart_moves_by_priority
    [:first_move, :computer_winning_move, :block_human_winning_move, :random_move]
  end

  def take_turn(board)
    correct_move = find_correct_move(board)
    send(correct_move, board)
  end

  def find_correct_move(board)
    smart_moves_by_priority.find { |move| send(move, board) }
  end

  def random_move(board)
    @space = available_spaces(board).sample
  end

  def computer_winning_move(board)
    if computer_winning_combo(board)
      # pick the winning move if there is one
      @space = computer_winning_combo(board)[2]
    end
  end

  def block_human_winning_move(board)
    # check if human player has a winning move
    if human_winning_combo(board)
      # move there if he does
      @space = human_winning_combo(board)[2]
    end
  end

  def first_move(board)
    # if computer's first move?
    choose_corners_or_middle(board) if spaces_left(board, 8)
  end

  def choose_corners_or_middle(board)
    # computer will take a random corner or middle available space(even indices)
    @space = available_spaces(board).select(&:even?).sample
  end

  def spaces_left(board, num)
    num_available_spaces(board) == num
  end

  def num_available_spaces(board)
    available_spaces(board).length
  end

  def available_spaces(board)
    board.map.with_index { |space, i| i if board[i].nil? }.compact
  end
end
