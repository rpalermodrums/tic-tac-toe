class Game
  attr_reader :human, :computer, :board

  def initialize
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
    @board = Board.new
    choose_marks
  end

  def choose_marks
    if human.mark == :X
      computer.mark = :O
    else
      computer.mark = :X
    end
  end

  def prompt_tic_tac_toe
    puts "Would you like to play a game of Tic-Tac-Toe? (Y/N)"
    gets.chomp.upcase
  end

  def run
    playing = true
    while playing
      question = prompt_tic_tac_toe
      playing = answer(question)
    end
  end

  def answer(question)
    if question == "Y"
      self.game_loop
    else
      quit
    end
  end

  def quit
    puts "Play again soon!"
    false
  end

  def game_loop
    human.create_leaderboard
    self.leaderboard
    self.see_wins
    self.play
  end

  def play
    #each game starts with an empty array
    board.clear
    #loop until the game is won or tied
    until board.over?
      inner_loop
    end
  end

  def inner_loop
    #puts out empty board to console
    self.display_board
    #human and computer each takes their turn
    self.turns
    # if the game is won
    win_tie
  end

  def win_tie
    if board.won
      # puts out winning board and tells the player who won
      show_winner
    elsif board.full?
      # displays board and tells the player they tied
      show_tie
    end
  end

  def show_winner
    self.display_board
    puts "#{winner} wins!"
  end

  def show_tie
    self.display_board
    puts "You tied!"
  end

  def winner
    if board.won == human.mark
      update_human
    else
      board.won
    end
  end

  def update_human
    human.add_win
    human.name
  end

  def turns
    #human goes, then computer
    self.human_turn
    self.computer_turn
  end

  def human_turn
    board.place_mark(human.take_turn, human.mark)
  end

  def computer_turn
    unless board.over?
      board.place_mark(computer.take_turn(board.grid), computer.mark)
    end
  end

  def display_board
    puts "    a   b   c  "
    puts "1   #{board.grid[0] || " "} | #{board.grid[1] || " "} | #{board.grid[2] || " "} "
    puts "   -----------"
    puts "2   #{board.grid[3] || " "} | #{board.grid[4] || " "} | #{board.grid[5] || " "} "
    puts "   -----------"
    puts "3   #{board.grid[6] || " "} | #{board.grid[7] || " "} | #{board.grid[8] || " "} "
    puts ""
  end

  def see_wins
    answer = prompt_user_wins
    answer_wins(answer)
  end

  def answer_wins(wins_answer)
    if wins_answer == "Y"
      puts "\nwins : #{human.wins}" + "\n"
    elsif wins_answer != "N"
      redirect_wins
    end
  end

  def redirect_wins
    puts "Not a valid answer"
    see_wins
  end

  def prompt_user_wins
    puts "Would you like to see your current wins? (Y/N)"
    wins_answer = gets.chomp.upcase
  end

  def leaderboard
    answer = prompt_user_leaderboard
    ask_leaderboard(answer)
  end

  def ask_leaderboard(answer)
    if answer.upcase == "Y"
      show_leaderboard
    elsif answer.upcase != "N"
      redirect_leaderboard
    end
  end

  def redirect_leaderboard
    puts "Not a valid answer"
    leaderboard
  end

  def prompt_user_leaderboard
    puts "Would you like to see the leaderboard? (Y/N)"
    gets.chomp
  end

  def show_leaderboard
    HumanPlayer.leaderboard.each do |player, score|
      puts "\n#{player} : #{score}"
      puts ""
    end
  end
end
