module Slideable
  private
  @@Horizontal = []
  @@Diagonal = [] 

  def moves(dir,curr_pos)
    if dir == :diagonal 
      diagonal_dirs(curr_pos)
    elsif dir == :horizontal 
      horizontal_dirs(curr_pos)
    else
      diagonal_dirs(curr_pos) + horizontal_dirs(curr_pos)
    end
  end

  def diagonal_dirs(curr_pos)
    diag_1, diag_2 = [], []

    # (0..7).each do |i|
    #   diag_1 << [i,i] unless [i,i] == curr_pos
    # end

    diag_1
  end


  def horizontal_dirs(curr_pos)
    
    curr_row, curr_col = curr_pos
    horizontal, vertical = [], []
    (0..7).each do |i|
      horizontal << [curr_row, i] unless i == curr_col
      vertical << [i, curr_col] unless i == curr_row
    end
    horizontal + vertical
  end


end


module Stepable
  
end