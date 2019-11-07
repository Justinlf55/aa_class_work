require_relative "chess_pieces"
require 'byebug'

class Board
  
  PIECES = {
      rook: { w:[[0,0],[0,7]],
              b:[[7,0],[7,7]]
            }, 
      #knight: { w:[[0,1],[0,6]],
                #b:[[7,1],[7,6]]
              #},
      #bishop: { w:[[0,2],[0,5]], 
                #b:[[7,2],[7,5]]
              #},
      #king: { w:[[0,3]], 
              #b:[[7,3]]
            #},
      queen:{ w:[[0,4]],
              b:[[7,4]]
            },
      # pawn:{ w:[[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7]],
      #        b:[[6,0],[6,1],[6,2],[6,3],[6,4],[6,5],[6,6],[6,7]]
      #       }
  }

  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) { Array.new(8,NullPiece.instance) }
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
    return nil if row < 0 || col < 0  
    debugger
    @grid[row][col]
  end

  def []=(position, piece)
    row, col = position
    raise ArgumentError if row < 0 || col < 0 
    @grid[row][col] = piece
  end
  
  private

  def fill_board
    PIECES.each do |piece,col_pos_hash|
      col_pos_hash.each do |color,pos_array|
        pos_array.each do |pos|
          case piece
          when :rook
            self[pos] = Rook.new(color,self,pos)
          when :knight
            self[pos] = Knight.new(color,self,pos)
          when :bishop
            self[pos] = Bishop.new(color,self,pos)
          when :queen
            self[pos] = Queen.new(color,self,pos)
          when :king
            self[pos] = King.new(color,self,pos)
          when :pawn
            self[pos] = Pawn.new(color,self,pos)
          end
        end
      end
    end
  end



end