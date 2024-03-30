# frozen_string_literal: true

# TicTacToe class
class TicTacToe
  # Initialize
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    @current_player = 'X'
  end
  # Display current state of game board

  def display_board
    # Display column numbers
    puts ' 1 2 3'
    @board.each_with_index do |row, idx|
      # Display each row with '|' as separator
      puts "#{idx + 1} #{row.join('|')}"
      puts '  -----'
    end
  end

  # Make move on specified row and column
  def make_move(row, col)
    # Check if chosen spot is empty
    if @board[row - 1][col - 1] == ' '
      # Place player symbol on board
      @board[row - 1][col - 1] = @current_player
      # Switch player
      switch_player
    else
      # Display msg if spot is not empty
      puts 'Invalid move! Try again'
    end
  end

  # Switch current player with X and O
  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  # Check winner Return 'X', 'O' or Nil if no winner
  def check_winner
    check_rows || check_columns || check_diagonal1 || check_diagonal2 || nil
  end

  def game_over?
    winner = check_winner
    return true if winner
    return true if @board.all? { |row| row.all? { |cell| cell != ' ' } }

    false
  end

  private

  def check_rows
    @board.each do |row|
      return row[0] if row.uniq.length == 1 && row[0] != ' '
    end
    nil
  end

  def check_columns
    @board.transpose.each do |col|
      return col[0] if col.uniq.length == 1 && col[0] != ' '
    end
    nil
  end

  def check_diagonal1
    diagonal1 = [@board[0][0], @board[1][1], @board[2][2]]
    return diagonal1[0] if diagonal1.uniq.length == 1 && diagonal1[0] != ' '

    nil
  end

  def check_diagonal2
    diagonal2 = [@board[0][2], @board[1][1], @board[2][0]]
    return diagonal2[0] if diagonal2.uniq.length == 1 && diagonal2[0] != ' '

    nil
  end
end

# Play tictactoe
game = TicTacToe.new

until game.game_over?
  game.display_board
  puts "Player #{@current_player}'s turn. Enter row (1-3) and column (1-3):"
  row = gets.chomp.to_i
  col = gets.chomp.to_i

  # Make move based on user input
  game.make_move(row, col)

end

# Display results
game.display_board
puts "Game over! #{game.check_winner || "It\'s a draw!"}"
