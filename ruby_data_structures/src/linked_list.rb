class LinkedList
  attr_reader :head,:tail,:length
  def initialize
  	@head = nil
  	@tail = nil
  	@length = 0
  end
  def add value
  	@length += 1
  	newNode = LinkedListNode.new(value)
  	if @tail
      @tail.next = newNode
  	else 
      @head = newNode
    end
    @tail = newNode

  end
  def remove
    @length -= 1
    if @head
      @head = @head.next
    end
  end
  def contains?(value)
    @head.contains?(value)
  end
end

class LinkedListNode
  attr_accessor :value, :next
  def initialize (value)
    @value = value
    @next = nil
  end
  def contains?(value)
    if @value == value
      return true
    elsif @next == nil
      return false
    else 
      return @next.contains?(value)
    end
  end


end
