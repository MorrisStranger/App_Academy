require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
    update_node!(@map[key])
    return @map[key].val
    else
      calc!(key)
      eject! if @max < @map.count
      return @map[key].val
    end
    
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    #just adds key and value to end of cache and updates key to point to node
    @store.append(key,@prc.call(key))
    
    @map[key]=@store.last
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    original =@store.last
    node.remove

    
    node.next = original.next
    node.prev = original
    original.next = node
    node.next.prev = node
    # @store.append(node.key,node.val)
    
    @map[node.key]=node
    
  end

  def eject!
    @map.delete(@store.first.key)
    @store.first.remove
end
end
