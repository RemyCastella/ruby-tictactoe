require_relative "./human_player"
require_relative "./computer_player"

class Game
  attr_accessor :board, :player, :players, :game_over
  WINNING_COMBOS = [
    [[0,0],[0,1],[0,2]],
    [[1,0],[1,1],[1,2]],
    [[2,0],[2,1],[2,2]],
    [[0,0],[1,0],[2,0]],
    [[0,1],[1,1],[2,1]],
    [[0,2],[1,2],[2,2]],
    [[0,0],[1,1],[2,2]],
    [[0,2],[1,1],[2,0]],
  ]

  def initialize
    @board = Array.new(3) {Array.new(3, "_")}
    @player = 0
    @players = [HumanPlayer.new, ComputerPlayer.new]
    @game_over = false
  end

  def start_game
    puts "Welcome to Tic-Tac-Toe: Man vs. Machine"
    puts "It's #{players[player].name}'s turn!"
    until game_over 
      get_active_player_input
      update_board
      break if winner?
      break if tie?
      print_board
      switch_player
    end
    announce_winner
    puts "Play again? (y/n)"
    ans = gets.chomp
    if ans == "y"
      restart_game
    end
  end

  private

  def winner?
    player_selections = players[player].selections
    if WINNING_COMBOS.any? {|combo| (combo - player_selections).empty? }
      self.game_over = true 
      players[player].make_winner
    end
  end

  def tie?
    !board.flatten.include?("_")
  end

  def announce_winner
    winner = players.select {|player| player.winner}
    if !winner.empty? 
      puts "#{winner[0].name} wins!"
    else
      puts "It's a tie!"
    end
    print_board
  end

  def restart_game
    self.board = Array.new(3) {Array.new(3, "_")}
    self.players = [HumanPlayer.new, ComputerPlayer.new]
    self.game_over = false
    start_game
  end

  def get_active_player_input
    players[player].get_user_input(players)
  end

  def print_board
    puts "\n"
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
    puts "It's #{players[player].name}'s turn!"
  end

  def update_board
    players[player].selections.each do |selection|
      board[selection[0]][selection[1]] = players[player].marker
    end
  end

end