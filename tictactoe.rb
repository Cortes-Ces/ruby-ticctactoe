class TicTacToe
    # Initialize the game board and set current player to 'X'
    def Initialize  
        @board = Array.new(3) { Array.new(3, ' ') }
        @current_player = 'X'
    end
end