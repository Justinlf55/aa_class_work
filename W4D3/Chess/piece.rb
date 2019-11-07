require_relative 'modules'
require 'singleton'

class Piece
  attr_reader :pos, :color, :board
  
  def initialize(color = :null,board = nil ,pos = nil)
    @color = color
    @board = board
    @pos = pos 
  end

  def pos=(position)
    @pos = position
  end

  def move_dirs
    :both
  end

  def symbol
    self.class.to_s.to_sym
  end

  def inspect
    "#{color} : #{symbol}"
    # color
    # symbol
  end


end

