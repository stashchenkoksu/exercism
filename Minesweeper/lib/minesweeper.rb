class Minesweeper
  attr_reader :board
  def initialize(board)
    @board = board
  end

  def mine_search(x ,y)
    mines = 0
    (y-1..y+1).each do |i|
      (x-1..x+1).each{|j| mines +=1 if board[i][j] == '*' }
    end
    mines.zero? ? ' ' : mines
  end

  def board_transform
    board_length = board[0].length
    board.each { |row| raise ArgumentError if (row =~ /^[\+,\|][-\s\*]+[\+,\|]$/).nil? || row.length > board_length }
    board.each_with_index.map do |row, y|
      row.split('').each_with_index.map {|square, x| square == ' ' ? mine_search(x,y) : square }.join('')
    end
  end

  def self.transform(input)
    new(input).board_transform
  end

end