require "byebug"
class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value=value
        @parent = nil
        @children = []

    end
    def inspect
        { 'value' => @value, 'parent_value' => @parent.value,"children"=>@children.map(&:value) }.inspect
    end
    def parent=(node)

        if !@parent.nil?
            @parent.remover(self)
            end
        @parent=node
        if !node.nil? ## not sure about this one
        node.append_child(self)
        end
        

    end
    def append_child(node)
        @children << node if not_child?(node)
    end

    def add_child(node)
    node.parent=(self)
    end
    def remover(node)
        # node.parent=(nil)
        @children.delete(node)
    end
    def remove_child(node)
        if not_child?(node)
            raise "node is not a child"
        else
        node.parent=nil
        end
    end
    def not_child?(node)
        !@children.include?(node)
    end
    def dfs(val)
        # debugger
        
        return self if self.value==val
        # return if self.nil?
        @children.each do |child|
        search_result = child.dfs(val)
        return search_result unless search_result.nil?
        end
        nil
        
    end
    # def bfs(val)
    
    #     queue=[self]
    #     until queue.empty?
    #     el = queue.shift
    #     return el if el.value==val
    #     el.children.each do |child|
    #         return child if child.value==val

    #         queue +=child.children
            
    
    #     end
    # end
    # end
    def bfs(val)
    
        queue=[self]
        el = queue.shift
        return el if el.value==val
        el.children.each do |child|
            return child if child.value==val

            queue +=child.children
            
    
        end
    end
end
#     a 
#   /   \
#  b      c
# / \    / \
#d  e   f   g
#
#
#


