require_relative "piece"

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8,nil) }
    fill_board
  end

  def in_bounds?(pos)
    row, col = pos
    return false if row > 7 || row < 0 
    return false if col > 7 || col < 0
    true
  end


  def move_piece(start_pos, end_pos)
    raise "Position out of bounds" if !in_bounds?(end_pos) || !in_bounds?(start_pos)
    raise "No piece at starting position entered" if self[start_pos].nil?
    raise "End position occupied" if !self[end_pos].nil? 
    
    # take the piece at start pos and change its position to end pos and vv
    self[start_pos].pos = end_pos
    # self[end_pos].pos = start_pos ##ASK A TA ABOUT THIS!
    
    self[end_pos] = self[start_pos]
    self[start_pos] = nil

  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, piece)
    row, col = position
    @grid[row][col] = piece
  end
  
  private
  def fill_board
    (0..1).each do |row|
      (0...grid.length).each do |col|
        pos = [row,col]
        self[pos] = Piece.new(:w,self,pos)
      end
    end

    (6..7).each do |row|
      (0...grid.length).each do |col|
        pos = [row,col]
        self[pos] = Piece.new(:b,self,pos)
      end
    end
  end
end