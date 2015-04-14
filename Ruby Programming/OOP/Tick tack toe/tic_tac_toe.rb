class Game
  def initialize
    @board = (0..9).to_a
    @turn = 1
    puts "FIELDS ARE MARKED WITH NUMBERS ON WHICH YOU CAN PLACE YOUR MARKER WHEN IT'S YOUR TURN"
    play
  end

  def show_board
    player_turn
    puts "-------------"
    puts "| #{@board[1]} | #{@board[2]} | #{@board[3]} |"
    puts "-------------"
    puts "| #{@board[4]} | #{@board[5]} | #{@board[6]} |"
    puts "-------------"
    puts "| #{@board[7]} | #{@board[8]} | #{@board[9]} |"
    puts "-------------"
  end

  def player_turn
    if @turn % 2 != 0
      puts "Player X turn"
    else
      puts "Player 0 turn"
    end
  end

  def making_a_play(k)
    if @turn % 2 != 0 && @board[k] != "X" && @board[k] != "O"
    @board[k] = "X"
    @turn += 1
    elsif @turn % 2 == 0 && @board[k] != "X" && @board[k] != "O"
      @board[k] = "O"
      @turn += 1
    else
      puts "That field is taken! Try again"
    end
    show_board
  end

  def check_winner
    if (@board[1] == "X" && @board[2] == "X" && @board[3] == "X") ||
        (@board[4] == "X" && @board[5] == "X" && @board[6] == "X") ||
        (@board[7] == "X" && @board[8] == "X" && @board[9] == "X") ||
        (@board[1] == "X" && @board[4] == "X" && @board[7] == "X") ||
        (@board[2] == "X" && @board[5] == "X" && @board[8] == "X") ||
        (@board[3] == "X" && @board[6] == "X" && @board[9] == "X") ||
        (@board[1] == "X" && @board[5] == "X" && @board[9] == "X") ||
        (@board[3] == "X" && @board[5] == "X" && @board[7] == "X")
      puts "X IS THE WINNER!"
      exit(0)
    elsif (@board[1] == "O" && @board[2] == "O" && @board[3] == "O") ||
        (@board[4] == "O" && @board[5] == "O" && @board[6] == "O") ||
        (@board[7] == "O" && @board[8] == "O" && @board[9] == "O") ||
        (@board[1] == "O" && @board[4] == "O" && @board[7] == "O") ||
        (@board[2] == "O" && @board[5] == "O" && @board[8] == "O") ||
        (@board[3] == "O" && @board[6] == "O" && @board[9] == "O") ||
        (@board[1] == "O" && @board[5] == "O" && @board[9] == "O") ||
        (@board[3] == "O" && @board[5] == "O" && @board[7] == "O")
      puts "O IS THE WINNER!"
      exit(0)
    end
  end

  def play
    show_board
    while true
      input = gets.chomp.to_i
      making_a_play(input)
      check_winner
    end
  end
end

g = Game.new