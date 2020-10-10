class Queens
  attr_reader :white, :black
  def initialize(positions)
    check_positions(positions[:white], positions[:black])
    @white = positions[:white]
    @black = positions[:black]
  end

  def attack?
    same_row? || same_column? || same_diagonal?
  end

  def same_row?
    white[0] == black[0]
  end

  def same_column?
    white[1] == black[1]
  end

  def same_diagonal?
    (white[1] - black[1]).abs == (white[0] - black[0]).abs
  end

  def check_positions(white, black)
    checker(white)
    checker(black)
  end

  def checker(arr)
    raise ArgumentError if arr.size != 2 || !arr.all? { |coordinate| coordinate.between?(0, 7) }
  end
end
