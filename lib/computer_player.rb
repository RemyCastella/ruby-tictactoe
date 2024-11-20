require_relative "./player"

class ComputerPlayer < Player 
  attr_accessor :marker, :name

  def initialize 
    super
    @name = "Machine"
    @marker = "X"
  end

  def get_user_input(players)
    num1 = Random.rand(3)
    num2 = Random.rand(3)
    until spot_available?(players, [num1, num2])
      num1 = Random.rand(3)
      num2 = Random.rand(3)
    end
    place_marker([num1, num2])
  end

  private

  def spot_available?(players, selection)
    !players[0].selections.include?(selection) && !players[1].selections.include?(selection)
  end

  def place_marker(arr)
    selections.push(arr)
  end

end