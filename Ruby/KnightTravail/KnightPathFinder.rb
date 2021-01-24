# require_relative("../polytreenode/solution/lib/00_tree_node.rb")

require_relative("../polytreenode/skeleton/lib/00_tree_node.rb")
class KnightPathFinder
  
    def self.valid_moves(pos)
        x,y=pos
         move_hashmap=[
            [1,2],
            [-1,2],
            [-1,-2],
            [1,-2],
            [2,1],
            [-2,1],
            [-2,-1],
            [2,-1]
         ]
    valid_moves=[]
    move_hashmap.each do |(a,b)|
        i=x+a
        j=y+b

        valid_moves << [i,j] if (0<=i && i<=7 && 0<=j && j<=7) 
    end
        valid_moves

   
    end
    def initialize(start)
        @start=start

        @root_node = PolyTreeNode.new(start)
        @considered_positions=[@start]

        #build_move_tree()
    end
    def build_move_tree
        queue=[@root_node]
        nodes=queue.dup
        until queue.empty?
            node=queue.shift
            new_move_positions(node.value).each do |childpos|

                child = PolyTreeNode.new(childpos)
        
                child.parent = node
                queue << child
                nodes << child
            end
        

        end
        nodes
    end
        def find_path(end_pos)
            p trace_path_back(end_pos)
            # @root_node.dfs(end_pos)


        end
        def trace_path_back(end_pos)
            path=[]
            node=@root_node.bfs(end_pos)

            
            until node==@root_node
                path << node.value
                node=node.parent
            end
            path << @root_node.value
            path.reverse
        end
    def new_move_positions(pos)
        new_positions=KnightPathFinder.valid_moves(pos).reject {|move| @considered_positions.include?(move)}
        @considered_positions+=new_positions
        new_positions
    end
end 
kpf = KnightPathFinder.new([0,0])
p kpf.build_move_tree
puts "bfs"

kpf.find_path([6,2])
