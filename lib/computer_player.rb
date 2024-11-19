require_relative "./player"

class ComputerPlayer < Player 
  attr_accessor :marker

  def initialize 
    super
    @marker = "X"
  end

  def get_user_input
    num1 = nil
    num2 = nil
    
    loop do
      puts "Enter row number (between 0 and 2)"
      num1 = gets.chomp.to_i
      break if num1.between?(0, 2)
      puts "Please enter a number between 0 and 2"
    end

    loop do
      puts "Enter column number (between 0 and 2)"
      num2 = gets.chomp.to_i
      break if num2.between?(0, 2)
      puts "Please enter a number between 0 and 2"
    end

    place_marker([num1, num2])
  end

  def place_marker(arr)
    selections.push(arr)
  end

end