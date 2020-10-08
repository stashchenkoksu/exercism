require_relative 'lib/meetup.rb'
require_relative 'lib/readme_viewer'

def user_input
  puts 'Enter the year'
  year = gets.chomp.to_i
  puts 'Enter a month'
  month = gets.chomp.to_i
  puts 'Enter a day of the week'
  day = gets.chomp.capitalize.to_sym
  puts 'Enter the order of a week'
  order = gets.chomp.to_sym
  [year, month, day, order]
end

args = ARGV.length != 4 ? user_input : ARGV
meetup = Meetup.new(args[1], args[0]).day(args[2], args[3])
puts meetup
