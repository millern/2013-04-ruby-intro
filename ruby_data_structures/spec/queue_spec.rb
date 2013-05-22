require '../src/queue.rb'

describe Queue do
	before(:each) do 
		@queue = Queue.new
	end

	it "initializes empty" do
	  @queue.length.should == 0
	end
    
  describe "#add" do 
    it "should increment the length" do 
      @queue.add("first")
      @queue.length.should == 1
    end
    it "should add to the array multiple times" do
      @queue.add("first")
      @queue.add("second")
      @queue.length.should == 2
    end
  end
  describe "#remove" do 
    before(:each) do
      @queue.add("first")
      @queue.add("second")
      @queue.add("third")
      @queue.add("fourth")
      @queue.add("fifth")
    end
    it "should decrement the length" do 
      @queue.length.should == 5
      @queue.remove()
      @queue.length.should == 4
    end
    it "should remove the first element added" do
      @queue.remove().should == "first"
    end
    it "should remove all elements in order" do 
      @queue.remove().should == "first"
      @queue.remove().should == "second"
      @queue.remove().should == "third"
      @queue.remove().should == "fourth"
      @queue.remove().should == "fifth"
    end
    it "should not remove when no elements are in the array" do 
      6.times do 
        @queue.remove()
      end
      @queue.length.should == 0
    end
  end




end