module Slideable
  
  def moves
    
    curr_pos = self.pos
    dir = self.move_dirs
    
    if dir == :diagonal 
      valid_moves = diagonal_dirs(curr_pos)
    elsif dir == :horizontal 
      valid_moves = horizontal_dirs(curr_pos,[])
    else
      valid_moves = horizontal_dirs(curr_pos,[]) + diagonal_dirs(curr_pos,[])
    end

  end
  
  # def diagonal_dirs(curr_pos)
  #   row, col = curr_pos
  #   diag_moves = []
    
  #   down_right = Proc.new {|new_row, new_col| new_row >= 7 || new_col >= 7}
  #   up_left = Proc.new {|new_row, new_col| new_row <= 0 || new_col <= 0}
  #   down_left = Proc.new {|new_row, new_col| new_row >= 7 || new_col <=0}
  #   up_right = Proc.new {|new_row, new_col| new_row <=0 || new_col >=7}
    
  #   diag_moves += diag_helper(curr_pos,1,1,down_right)
  #   diag_moves += diag_helper(curr_pos,-1,-1,up_left)
  #   diag_moves += diag_helper(curr_pos,+1,-1,down_left)
  #   diag_moves += diag_helper(curr_pos,-1,+1,up_right)
    
  #   diag_moves
  # end
  
  
  # def horizontal_dirs(curr_pos)
    
  #   curr_row, curr_col = curr_pos
  #   horizontal = []
  #   (0..7).each do |i|
  #     new_h_pos = [curr_row, i]
  #     h_checked = board[new_h_pos]
      
  #     # if new_h_pos != curr_pos
  #       if h_checked.symbol == :NullPiece
  #         horizontal << new_h_pos
  #       elsif h_checked.color != self.color
  #         horizontal << new_h_pos
  #         return horizontal
  #       elsif h_checked.color == self.color
  #         return horizontal
  #       end
  #     # end

  #   end
  #   horizontal
  # end

  def horizontal_dirs(curr_pos, checked)
    horizontal_helper(curr_pos,checked)[1..-1]
  end

  def diagonal_dirs(curr_pos, checked)
    diagonal_helper(curr_pos,checked)[1..-1]
  end


  def horizontal_helper(curr_pos,checked)
    
    return [] if board[curr_pos] == nil
    return [] if board[curr_pos] != nil && board[curr_pos].color == self.color && self.pos != curr_pos

    checked << curr_pos if !checked.include?(curr_pos) 
    
    row,col = curr_pos
    next_steps = [[row,col+1],[row,col-1],[row+1,col],[row-1,col]]
    
    first_res = horizontal_helper(next_steps.shift,checked) 
    next_steps.inject(first_res) do |acc,step|
      if !checked.include?(step)
        acc + horizontal_helper(step,checked)
      else
        acc
      end
    end
    checked
  end

  def diagonal_helper(curr_pos, checked)
    debugger
    return [] if board[curr_pos] == nil
    return [] if board[curr_pos] != nil && board[curr_pos].color == self.color && self.pos != curr_pos

    checked << curr_pos if !checked.include?(curr_pos) 
    
    row,col = curr_pos
    next_steps = [[row+1,col+1],[row-1,col-1],[row+1,col-1],[row-1,col+1]]
    
    first_res = diagonal_helper(next_steps.shift,checked) 
    next_steps.inject(first_res) do |acc,step|
      if !checked.include?(step)
        acc + diagonal_helper(step,checked)
      else
        acc
      end
    end
    checked
  end





  # def vertical_dirs(curr_pos)
  #   curr_row, curr_col = curr_pos
  #   vertical = []

  #   (0..7).each do |i|
  #     new_v_pos = [i, curr_col]
  #     v_checked = board[new_v_pos]

  #     if v_checked.symbol == :NullPiece
  #       vertical << new_v_pos
  #     elsif v_checked.color != self.color
  #       vertical << new_v_pos
  #       return vertical
  #     elsif v_checked.color == self.color
  #     end

  #   end

  #   vertical
  # end


  private
  def diag_helper(curr_pos, delta_1, delta_2,prc)
    moves = []
    row, col = curr_pos
    new_row = row
    new_col = col
    until prc.call(new_row, new_col) 
      new_row += delta_1
      new_col += delta_2
      new_pos = [new_row,new_col]
      checked = board[new_pos]
     
      if checked.symbol == :NullPiece 
        moves << new_pos
      elsif checked.color != self.color
        moves << new_pos
        return moves
      end
   
    end
    moves
  end
  
  @@Horizontal = []
  @@Diagonal = [] 
end
