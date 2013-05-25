require '../src/tree.rb'

describe Tree do
  before(:each) do
    @tree = Tree.new
  end
  it('should create an empty tree') do
  end
  describe("#insert") do
    before(:each) do
      @tree.insert(2)
    end
    it("should insert a root node")do
      @tree.root.value.should eq(2)
    end
    it("should insert lower values to the left") do
      @tree.insert(1)
      @tree.root.left.value.should eq(1)    
    end
    it("should isert higher values to the right") do
      @tree.insert(3)
      @tree.root.right.value.should eq(3)
    end
  end
  describe("#remove") do
    before(:each) do
      @tree.insert(2)
      @tree.insert(1)
      @tree.insert(3)
    end
    it("should remove a leaf element") do
      @tree.remove(3)
      @tree.root.value.should eq(2)
      @tree.root.right.should eq(nil)
      @tree.root.left.value.should eq(1)
    end
    it("should remove another leaf element") do
      @tree.remove(3)
      @tree.remove(1)
      @tree.root.right.should eq(nil)
      @tree.root.left.should eq(nil)
    end
    it("should remove the root") do
      @tree.remove(3)
      @tree.remove(1)
      @tree.remove(2)
      @tree.root.should eq(nil)
    end
  end
  describe("#remove from internal nodes") do
    
    before(:each) do
      @tree.insert(7);
      @tree.insert(3);
      @tree.insert(10)
      @tree.insert(4)
      @tree.insert(1)
      @tree.insert(8)
      @tree.insert(12)
    end
    it("should remove from internal nodes") do
      @tree.remove(3)
      @tree.contains?(3).should eq(false)
      @tree.remove(10)
      @tree.contains?(10).should eq(false)
      @tree.root.left.value.should eq(4)
      @tree.root.left.right.should eq(nil)
    end
  end
  describe("#contains") do
    before(:each) do
      (1..10).each do |i|
        @tree.insert(i)
      end
    end
    it("should return true for values in the tree") do 
      @tree.contains?(1).should eq(true)
      @tree.contains?(2).should eq(true)
      @tree.contains?(3).should eq(true)
      @tree.contains?(4).should eq(true)
      @tree.contains?(5).should eq(true)
      @tree.contains?(6).should eq(true)
      @tree.contains?(7).should eq(true)
      @tree.contains?(8).should eq(true)
      @tree.contains?(9).should eq(true)
      @tree.contains?(10).should eq(true)
    end
    it("should return false for values not in the tree") do
      @tree.contains?(11).should eq(false)
      @tree.contains?(0).should eq(false)
    end
  end

end
