require "colorize"
require "pry"

@memory = 0

def start_up
  puts "============= Welcome to the Calculator ================".colorize(:yellow)
  first_input
end

def first_input
  puts "Please input your basic calculation:"
  puts "(ex. 1 + 1 or 3 * 3)"
  puts "------------------------------------".colorize(:yellow)
  expression = gets.strip
  if validate(expression)
    calculation(expression)
  else
    puts "sorry that is an invalid format, try again.".colorize(:red)
    user_input
  end
end

def continuation_menu
  puts "-----------------------------------".colorize(:yellow)
  puts "1) Additional calculation to #{@memory}?"
  puts "2) New calculation?"
  puts "3) Exit"
  input = gets.strip.to_i
  case input
    when 1
      second_calculation
    when 2
      first_input
    when 3
      exit
    else
      "Invalid choice, select again"
      continuation_menu
  end
end

def second_calculation
  puts "------------------------------------".colorize(:yellow)
  puts "Memory: #{@memory}"
  puts "------------------------------------".colorize(:yellow)
  puts "What is the operator? (ex. + - * /)"
  op = gets.strip
  puts "What is the second number?"
  num2 = gets.strip.to_i
  expression = "#{@memory} #{op} #{num2}"
  if validate(expression)
    calculation(expression)
  else
    puts "Invlaid format, try again"
    second_calculation
  end
end

def calculation(expression)
  chars = expression.split(' ')
  num_one = chars[0].to_i
  num_two = chars[2].to_i
  case chars[1]
    when "+"
      puts "Answer: #{num_one + num_two}".colorize(:cyan)
      @memory = num_one + num_two
    when "-"
      puts "Answer: #{num_one - num_two}".colorize(:cyan)
      @memory = num_one - num_two
    when "*"
      puts "Answer: #{num_one * num_two}".colorize(:cyan)
      @memory = num_one * num_two
    when "/"
      puts "Answer: #{num_one / num_two}".colorize(:cyan)
      @memory = num_one / num_two
    else
      puts "You input a bad modifier, please begin again"
      first_input
  end
  continuation_menu
end

def validate(expression)
  if /\d+ (\+|\-|\/|\*) \d+/.match(expression)
    return true
  else
    return false
  end
end

start_up
