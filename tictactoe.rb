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


end

test = TicTacToe.new
test.display_board