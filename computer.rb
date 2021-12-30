class Computer
  attr_reader :feedback_status
  
  def initialize(colors)
    @colors = colors
    @selection = nil
    @feedback_status = nil
  end

  def random_selection
    @selection = @colors.sample(4)
  end

  def make_guess
    # pass
  end

  def feedback(guess)
    wrong_order = 0
    correct = 0
    guess.each_with_index do |color, i|
      if @selection.include?(color)
        if @selection[i] == color
          correct += 1
        else
          wrong_order += 1
        end
      end
    end
    puts "feedback: There are #{wrong_order} colors in the wrong order and #{correct} placed correctly!"
    # this can be motified - instead of true false lets have the actual values of wrong_order and correct
    correct == 4 ? @feedback_status = true : @feedback_status = false
  end
end