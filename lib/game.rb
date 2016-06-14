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

  def run
    while true
      puts "Would you like to play a game of Tic-Tac-Toe? (Y/N)"
      answer = gets.chomp.upcase
      if answer == "Y"
        #update leaderboard
        human.create_leaderboard
        leaderboard
        see_wins
        play
      elsif answer == "N"
        puts "Play again soon!"
        break
      else
        "Not a valid answer"
      end
    end
  end

  def play
    #each game starts with an empty array
    board.clear
    #loop until the game is won or tied
    until board.over?
      #puts out empty board to console
      display_board
      #human and computer each takes their turn
      turns
      # if the game is won
      if !board.won.nil?
        # puts out winning board and tells the player who won
        display_board
        puts "#{
        if board.won == human.mark
          human.add_win
          human.name
        else
          board.won
        end
          } wins!"
      elsif board.full?
        # tells the player they tied
        puts "You tied!"
      end
    end
  end

  def display_board
    puts "  a   b   c  "
    puts "1 #{board.grid[0] || " "} | #{board.grid[1] || " "} | #{board.grid[2] || " "} "
    puts " -----------"
    puts "2 #{board.grid[3] || " "} | #{board.grid[4] || " "} | #{board.grid[5] || " "} "
    puts " -----------"
    puts "3 #{board.grid[6] || " "} | #{board.grid[7] || " "} | #{board.grid[8] || " "} "
    puts ""
  end

  def turns
    #human goes
    board.place_mark(human.take_turn, human.mark)
    # binding.pry
    unless board.over?
      computer.take_turn(board.grid)
      board.place_mark(computer.space, computer.mark)
    end
  end

  def see_wins
    puts "Would you like to see your current wins? (Y/N)"
    wins_answer = gets.chomp.upcase
    if wins_answer == "Y"
      puts "\nwins : #{human.wins}"
      puts ""
    elsif wins_answer != "N"
      puts "Not a valid answer"
      see_wins
    end
  end

  def leaderboard
    puts "Would you like to see the leaderboard? (Y/N)"
    answer = gets.chomp
    if answer.upcase == "Y"
      HumanPlayer.leaderboard.each do |player, score|
        puts "\n#{player} : #{score}"
        puts ""
      end
    elsif answer.upcase != "N"
      puts "Not a valid answer"
      leaderboard
    end
  end
end
