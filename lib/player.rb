class Player
  attr_accessor :selections, :marker, :winner

  def initialize
    @selections = []
    @winner = false
  end

  def make_winner
    self.winner = true
  end

end