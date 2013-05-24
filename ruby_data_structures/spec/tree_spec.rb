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
      (1..3).each do |i|
        @tree.insert(i)
      end
    end
    xit("should remove an element") do
      @tree.remove(3)
      @tree.right.should eq(nil)
    end
    xit("should remove another element") do
      @tree.remove(3)
      @tree.remove(1)
      @tree.root.right.should eq(nil)
      @tree.root.left.should eq(nil)
    end
    xit("should remove the root") do
      @tree.remove(3)
      @tree.remove(2)
      @tree.remove(1)
      @tree.root.should eq(nil)
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
