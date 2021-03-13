class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end
  def inspect
    {key:@key,value:@val}.inspect
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next=@next
    @next.prev = @prev
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head, @tail = Node.new(), Node.new()
    @head.next =@tail 
    @tail.prev  =@head
  
  end
  def inspect
  {head:@head,tail:@tail,first:@head.next,last:@tail.prev}.inspect
  end
  

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
  @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    !@head.next.key
  end

  def get(key)
    self.any?{|node|  return node.val if node.key==key   }
    nil
  end

  def include?(key)
    self.any? {|node| node.key==key}
  end

  def append(key, val)
    node = Node.new(key,val)
    node.next = @tail
    node.prev = last
    last.next=node
    @tail.prev=node

    
  end

  def update(key, val)
    self.any? {|node| node.val=val if node.key==key}    
  end

  def remove(key)
    each {|node| node.remove if node.key==key}
  end

  def each
    node = @head.next
    until node ==@tail
    yield node
    node =node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
