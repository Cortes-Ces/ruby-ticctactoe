class TicTacToe
    # Initialize the game board and set current player to 'X'
    def initialize  
        @board = Array.new(3) { Array.new(3, ' ') }
        @current_player = 'X'
    end

    # Display current state of game board
    def display_board
        puts " 1 2 3" # Display column numbers
        @board.each_with_index do |row, idx|
            puts "#{idx + 1} #{row.join('|')}" # Display each row with '|' as separator
            puts "  -----"
        end
    end

    # Make move on specified row and column
    def make_move (row, col)
        if @board[row - 1][col - 1] == ' ' # Check if chosen spot empty
            @board[row - 1][col-1] = @current_player # Place player symbol on board
            switch_player # Switch player for next turn
        else
            puts "Invalid move! Try again" # Display msg if spot not empty
        end
    end

    # Switch current player between X and O
    def switch_player
        @current_player = (@current_player == 'X') ?  'O' : 'X'
    end

end


test = TicTacToe.new
test.display_board