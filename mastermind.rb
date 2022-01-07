require './computer'
require './utils'

class Mastermind
  include Utils

  def initialize
    @turns = 12
    @computer = Computer.new(COLORS)
  end

  def play_as_codebreaker
    @computer.random_selection
    puts "The computer has choosen 4 random colors. You have #{@turns} turns available to guess them."

    display_colors_list
    until @turns == 1
      play_turn_codebreaker
      break if @computer.solved?

      @turns -= 1
    end
    if @computer.solved?
      puts 'Congratulations! You have guessed the code!'
      return
    end
    puts 'Sorry, you have ran out of turns!'
  end

  def play_as_codemaker
    puts 'You have to choose 4 colors for the computer to guess'
    display_colors_list
    master = user_input
    until @turns == 1
      @computer.make_guess(master)
      break if @computer.solved?

      @turns -= 1
    end
    if @computer.solved?
      puts 'The computer has guessed your code :('
      return
    end
    puts 'The computer has ran out of turns!'
  end

  def play_turn_codebreaker
    guess = user_input
    @computer.compare(guess, @computer.selection)
    puts "Your guess has #{@computer.feedback[0]} exact matches and #{@computer.feedback[1]} colors in the wrong order"
  end
end
