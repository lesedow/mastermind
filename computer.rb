class Computer
  attr_reader :feedback, :selection

  def initialize(colors)
    @colors = colors
    @selection = []
    @comp_guess = %w[red red green green]
    @all_possible_guesses = @colors.repeated_permutation(4).to_a
    @feedback = nil
  end

  def random_selection
    4.times { @selection << @colors.sample }
  end

  def make_guess(code)
    compare(@comp_guess, code)
    puts "The computer has tried: #{@comp_guess}"
    return if solved?

    @comp_guess = shrinked_permutations
  end

  def shrinked_permutations
    old_feedback = @feedback
    @all_possible_guesses.delete_if do |combination|
      compare(combination, @comp_guess)
      old_feedback != @feedback
    end
    @all_possible_guesses[0]
  end

  def match(guess, code)
    match = 0
    guess.each_with_index do |color, i|
      next unless code[i] == color

      match += 1
      code[i] = nil
      guess[i] = nil
    end
    match
  end

  def wrong_order(guess, code)
    wrong = 0
    guess.each_with_index do |color, i|
      next unless !color.nil? && code.include?(color)

      wrong += 1
      code[code.index(color)] = nil
      guess[i] = nil
    end
    wrong
  end

  def compare(guess, code)
    guess = guess.clone
    code = code.clone
    @feedback = [match(guess, code), wrong_order(guess, code)]
  end

  def solved?
    @feedback[0] == 4
  end
end
