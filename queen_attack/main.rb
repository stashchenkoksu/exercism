require_relative 'lib/queen_attack'
require_relative 'lib/readme_viewer'

def get_argv(first_coord, second_coord)
  2.times { |i| first_coord << ARGV[i].to_i }
  2.times { |i| second_coord << ARGV[i + 2].to_i }
end

def get_user_input(first_coord, second_coord)
  puts 'Enter first pair of coordinates'
  print 'x: '
  first_coord << gets.to_i
  print 'y: '
  first_coord << gets.to_i
  puts 'Enter second pair of coordinates'
  print 'x: '
  second_coord << gets.to_i
  print 'y: '
  second_coord << gets.to_i
end

first_coord = []
second_coord = []
ARGV.length == 4 ? get_argv(first_coord, second_coord) : get_user_input(first_coord, second_coord)
puts Queens.new(white: first_coord, black: second_coord).attack?
