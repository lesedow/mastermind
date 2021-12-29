class Mastermind
  COLORS = ['red', "green", 'blue', 'yellow', 'cyan', 'pink', 'purple']
  
  def initialize(turns = 12, player_role = 'codebreaker')
    @turns = turns
    @player_role = player_role
  end

  def start
    @player_role == 'codebreaker' ? play_as_guesser : play_as_maker
  end

  def play_as_guesser
    # Make the computer select 4 random colors
    @computer_selection = random_selection
    puts "The computer has choosen 4 random colors. You have #{@turns} turns available to guess them."
   
    # The player will have n number of turns available to guess the colors
    puts "This is the list of all the available colors"
    COLORS.each { |color| print "#{color}, "}
    puts "\nIn order to make a guess, you have to type all of the four colors (ex: blue cyan red green)"
    until @turns == 0
      play_turn
      break if @feedback_status
      @turns -= 1
    end
    conclude    
    # Each turn the computer will give some feedback about the player's guess
  end 

  def play_turn
    player_guess = gets.chomp.split(' ')
    if player_guess.length != 4
      puts "You should include all the colors in this manner: blue cyan red green"
      play_turns
    end
    feedback(player_guess)
  end

  def conclude
    if @feedback_status
      puts "Congrats! You have guessed the computer selection of colors."
      return
    end
    puts "You have no more turns left! Sorry."
  end

  def random_selection
    COLORS.sample(4)    
  end

  def feedback(guess)
    wrong_order = 0
    correct = 0
    guess.each_with_index do |color, i|
      if @computer_selection.include?(color)
        if @computer_selection[i] == color
          correct += 1
        else
          wrong_order += 1
        end
      end
    end
    puts "feedback: There are #{wrong_order} colors in the wrong order and #{correct} placed correctly!"
    correct == 4 ? @feedback_status = true : @feedback_status = false
  end
end

Mastermind.new.start