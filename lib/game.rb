require_relative "./human_player"
require_relative "./computer_player"

class Game
  attr_accessor :board, :player, :players

  def initialize
    @board = Array.new(3) {Array.new(3, "_")}
    @player = 0
    @players = [HumanPlayer.new, ComputerPlayer.new]
  end

  def start_game
    loop do 
      players[player].get_user_input
      update_board
      print_board
      switch_player
    end
  end

  def print_board
    board.each_with_index do |row, idx|
      puts(
        row.each_with_index.reduce("") do |acc, (val, col_idx)|
          col_idx < 2 ? acc + "#{val}|" : acc + "#{val}"
        end
      )
    end
    puts "\n"
  end

  def switch_player
    self.player = player == 0 ? 1 : 0
    puts "It's player #{player}'s turn!"
  end

  def update_board
    players[player].selections.each do |selection|
      board[selection[0]][selection[1]] = players[player].marker
    end
  end

end