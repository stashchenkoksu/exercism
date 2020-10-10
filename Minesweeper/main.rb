require_relative 'lib/minesweeper'
require_relative 'lib/file_reader'

file = FileReader.new.file_read
puts Minesweeper.transform(file)