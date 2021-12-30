require './mastermind'

def main
  role = gets.chomp

  case role
  when 'codebreaker'
    Mastermind.new.play_as_codebreaker
  when 'codemaker'
    Mastermind.new.play_as_codemaker
  else
    puts 'Invalid role, choose again.'
    main
  end
end

puts 'Welcome to Mastermind! Select your role: codebreaker or codemaker'
main
