def user_input
  puts "Enter matrix string by template : 1 2 3, 4 5 6, 7 8 9 "
  matrix_rows = gets.chomp
end

class Matrix
  attr_reader :rows, :columns
  def initialize(string)
    @rows = string.split(",").map{|row| row.split(' ').map(&:to_i)}
    @columns = rows.transpose
  end
end

matrix_string = ARGV[0].nil? ? user_input : ARGV[0]
matrix = Matrix.new(matrix_string)
columns = matrix.columns
rows = matrix.rows
puts columns.to_s
puts rows.to_s

