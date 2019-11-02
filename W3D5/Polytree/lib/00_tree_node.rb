

class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end
    
    def parent=(node)
        if @parent != nil
            self.parent.children.delete(self)
        end
        @parent = node
        if @parent != nil
            node.children << self
        end
        self
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if child_node.parent == nil
            raise "Not a child"
        else
            child_node.parent = nil
        end
    end


    def dfs(target)
        return self if self.value == target
        
        
        self.children.each do |child|
            check = child.dfs(target)
            if check != nil
                return check
            end
        end
        
        nil
    end

    def bfs(target)
        queue = [self]

        until queue.empty?
            current = queue.shift
            return current if current.value == target
            queue.concat(current.children)
        end
    end


end