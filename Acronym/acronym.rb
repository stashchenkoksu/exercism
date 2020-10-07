require_relative 'readme_viewer'

def make_acronym(string)
  acr = string.split('-').join(' ').split.map(&:chr).join.upcase
end

def user_input
  puts 'Enter a string:'
  string = gets.chomp
end

input = ARGV[0].nil? ? user_input : ARGV[0]
puts make_acronym(input)
