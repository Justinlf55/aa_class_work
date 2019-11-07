require_relative 'modules'
require_relative 'piece'

class Knight < Piece 
  include Steppable
end