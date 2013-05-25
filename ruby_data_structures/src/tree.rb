class Tree
attr_accessor :root
  def initialize
    @root = nil
  end
  def insert (value)
    if @root
        @root.insert(value)
    else
      @root = TreeNode.new(value,self)
    end
  end
  def remove (value)
    @root.remove(value)
  end
  def contains? (value)
    @root.contains?(value)
  end
end

class TreeNode 
  attr_accessor :left, :right, :value
  def initialize(value,parent)
    @value = value
    @left = nil
    @right = nil
    @parent = parent
  end
  def insert(value)
    if @right and (value > @value)
        @right.insert(value)
    elsif @left and (value < @value)
        @left.insert(value)
    elsif value > @value
        @right = TreeNode.new(value,self)
    elsif value < @value
        @left = TreeNode.new(value,self)
    end
  end
  def contains?(value)
    if @value == value
        return true
    elsif @left 
      return @left.contains?(value)
    elsif @right
      return @right.contains?(value)
    else 
      return false
    end
  end
  def remove(value)
    if @value == value
      if !@left or !@right #deleting a node with 0-1 children
        if !@left
          child = @right
        else
          child = @left
        end
        if @parent.is_a? Tree #deleting the root node
            puts child
            @parent.root = child
        elsif (@value < @parent.value) #parent's left node
            @parent.left = child
        else #parent's right node
            @parent.right = child
        end
      else  #deleting a node with 2 children
        @value = @right.value
        @right.remove(@value)
      end
    elsif @left and @value > value
      @left.remove(value)
    elsif @right and @value < value
      @right.remove(value)
    end    
  end
end
