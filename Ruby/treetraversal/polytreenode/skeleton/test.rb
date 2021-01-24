require_relative("./lib/00_tree_node.rb")
class Test
    def initialize(value)
        @value = value
    end
def tester
    a=self.dup
    p a
    b=[a]
    p b
    p self
end
end

a=PolyTreeNode.new("a")
b=PolyTreeNode.new("b")
c=PolyTreeNode.new("c")
d=PolyTreeNode.new("d")
e=PolyTreeNode.new("e")
f=PolyTreeNode.new("f")
g=PolyTreeNode.new("g")



b.parent=a
c.parent=a
d.parent=b
e.parent=b
f.parent=c
g.parent=c
p a.bfs("f")

# testgame=Test.new("val")
# testgame.tester

# a=[1,2,3]
# a.each do |ele|
#     a << [3,5] if ele ==2  
#     p ele
#     end
 