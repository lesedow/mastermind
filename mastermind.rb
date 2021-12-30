require './computer'

class Mastermind
  COLORS = ['red', "green", 'blue', 'yellow', 'cyan', 'purple']

  def initialize
    @turns = 12
    # @player_role = player_role
    @computer = Computer.new(COLORS)
  end

  def play_as_codebreaker
    @computer.random_selection
    puts "The computer has choosen 4 random colors. You have #{@turns} turns available to guess them."
    
    display_colors_list
    until @turns.zero?
      play_turn_codebreaker
      break if @computer.feedback_status

      @turns -= 1
    end
    conclude
  end

  def play_as_codemaker
    puts "You have to choose 4 colors for the computer to guess"
    display_colors_list
    select_as_codemaker
  end

  # select_as_codemaker and play_turn can be combined into one function
  def validate_input(input)
    any_color_not_included = input.any? { |color| COLORS.include?(color) == false}
    if input.length != 4 || any_color_not_included
      puts 'You didn\'t respect the specified selection rule or you\'ve entered invalid colors, try again!'
      return false
    end 
    return true
  end

  def user_input
    while true
      input = gets.chomp.split(' ')
      break input if validate_input(input)
    end
  end

  def play_turn_codebreaker
    guess = user_input
    @computer.feedback(guess)
  end

  def play_turn_codemaker
    code = user_input
    @computer.make_guess(code)
  end

  def display_colors_list
    puts 'This is the list of all the available colors'
    COLORS.each { |color| print "#{color}, "}
    puts "\nYou have to type 4 colors in this manner: blue cyan red green"
  end

  def conclude
    if @computer.feedback_status
      puts 'Congrats! You have guessed the computer selection of colors.'
      return
    end
    puts 'You have no more turns left! Sorry.'
  end
end