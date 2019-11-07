require 'singleton'
require_relative 'modules'
require_relative 'piece'

class NullPiece < Piece
  include Singleton
end