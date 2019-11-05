require_relative "./PolyTreeNode.rb"

class KnightPathFinder
  attr_reader :root_node, :considered_positions

  def self.valid_moves?(pos)
    return false if pos[0] > 7 || pos[1] > 7 || pos[0] < 0 || pos[1] < 0
    true
  end

  def initialize(pos)
      @start_pos = pos
      @considered_positions = [pos]
      @root_node = PolyTreeNode.new(pos)
  end
  require 'byebug'
  def new_move_positions(current_pos)
    moves = []
    # debugger
    (0..7).each do |move|
      case move
        when 0
          moves << [current_pos[0] + 2, current_pos[1] + 1]
        when 1
          moves << [current_pos[0] + 2, current_pos[1] - 1]
        when 2
          moves << [current_pos[0] - 2, current_pos[1] + 1] 
        when 3
          moves << [current_pos[0] - 2, current_pos[1] - 1] 
        when 4
          moves << [current_pos[0] + 1, current_pos[1] + 2]    
        when 5
          moves << [current_pos[0] + 1, current_pos[1] - 2]  
        when 6
          moves << [current_pos[0] - 1, current_pos[1] + 2]  
        when 7
          moves << [current_pos[0] - 1, current_pos[1] - 2]  
      end
    end

    moves.select! do |move| 
      KnightPathFinder.valid_moves?(move) && !@considered_positions.include?(move)
    end

    @considered_positions += moves
  end
  require 'byebug'
  def build_move_tree
    # debugger
    queue = [@root_node]

   while !queue.empty? && self.considered_positions.length < 64
      current_node = queue.shift
   
      # debugger
      self.new_move_positions(current_node.value).each do |pos|
        next_node = PolyTreeNode.new(pos)
        queue << next_node
        current_node.add_child(next_node)
      end

    end 
    
  end

  def find_path(end_pos)
    queue = [@root_node]
      until queue.empty?
        current_node = queue.shift
        # debugger
        if current_node.value == end_pos
            return current_node
        else
          queue.concat(@root_node.children)
        end
      end
    # @root_node.bfs(end_pos)
  end

  def trace_path_back(node, visited = Set.new())
    return nil if visited.include?(node.root_node)

    visted.add(node.root_node)

    node.children.each do |pos|
      trace_path_back(pos, visited)
    end


  end


end

# t = KnightPathFinder.new([0,0])
# t.build_move_tree
# p t.find_path([7,6])