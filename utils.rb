module Utils
  COLORS = ['red', "green", 'blue', 'yellow', 'cyan', 'purple']

  def validate_input(input)
    any_color_not_included = input.any? { |color| COLORS.include?(color) == false}
    if input.length != 4 || any_color_not_included
      puts 'You didn\'t respect the specified selection rule or you\'ve entered invalid colors, try again!'
      return false
    end
    true
  end

  def user_input
    while true
      input = gets.chomp.split(' ')
      break input if validate_input(input)
    end
  end

  def display_colors_list
    puts 'This is the list of all the available colors'
    COLORS.each { |color| print "#{color}, "}
    puts "\nYou have to type 4 colors in this manner: blue cyan red green"
  end
end
