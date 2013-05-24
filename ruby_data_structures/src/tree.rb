class Tree
attr_accessor :root
  def initialize
    @root = nil
  end
  def insert (value)
    if @root
        @root.insert(value)
    else
      @root = TreeNode.new(value)
    end
  end
  def remove (value)
  end
  def contains? (value)
    @root.contains?(value)
  end
end

class TreeNode 
  attr_accessor :left, :right, :value
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
  def insert(value)
    if @right and (value > @value)
        @right.insert(value)
    elsif @left and (value < @value)
        @left.insert(value)
    elsif value > @value
        @right = TreeNode.new(value)
    elsif value < @value
        @left = TreeNode.new(value)
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
end
