require_relative "./player"

class HumanPlayer < Player 
  attr_accessor :marker, :name

  def initialize 
    super
    @name = "Man"
    @marker = "O"
  end

  def get_user_input(players)
    num1 = nil
    num2 = nil
    loop do 
      num1 = select_number
      num2 = select_number
      break if spot_available?(players, [num1, num2])
      puts "Spot is already taken! Choose another spot.\n"
    end
      place_marker([num1, num2])
  end

  private

  def select_number
    num = nil
    loop do
      puts "Enter a number between 0 and 2"
      num = gets.chomp.to_i
      break if num.between?(0, 2)
      puts "Please enter a number between 0 and 2"
    end
    return num
  end

  def spot_available?(players, selection)
    !players[0].selections.include?(selection) && !players[1].selections.include?(selection)
  end

  def place_marker(arr)
    selections.push(arr)
  end

end
