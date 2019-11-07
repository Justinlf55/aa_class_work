require_relative 'modules'
require_relative 'piece'

class Queen < Piece
  include Slideable
end