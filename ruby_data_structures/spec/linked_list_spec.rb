require '../src/linked_list.rb'

describe LinkedList do
  before(:each) do 
    @ll = LinkedList.new
  end

  it('should initialize with length 0') do
    @ll.length.should eq(0)
    @ll.head.should eq(nil)
    @ll.head.should eq(nil)
  end
  describe('#add') do
  	before(:each) do
      @ll.add("first");
    end
    it('should increment the length') do
    	@ll.length.should eq(1)
    end
    it('should set the head and tail') do
      @ll.head.value.should eq("first");
      @ll.tail.value.should eq("first");
    end
    it('should set the next value of the new node') do
      @ll.head.next.should eq(nil);
    end
    it('should add multiple nodes') do
      @ll.add("second");
      @ll.add("third");
      @ll.add("fourth");
      @ll.head.value.should eq("first")
      @ll.tail.value.should eq("fourth")
      @ll.head.next.value.should eq("second")
      @ll.head.next.next.value.should eq("third")
      @ll.head.next.next.next.value.should eq("fourth")
    end
  end
  describe("#remove") do 
    before(:each) do 
      @ll.add("first")
      @ll.add("second")
      @ll.add("third")
      @ll.add("fourth")
    end
    it('should decrement the length') do
    @ll.length.should eq(4)
    @ll.remove()
    @ll.length.should eq(3)
    end
    it('should remove from the head') do
      @ll.head.value.should eq("first")
      @ll.remove()
      @ll.head.value.should eq("second")
    end
  end
  describe("#contains") do
    before(:each) do 
      @ll.add("first")
      @ll.add("second")
      @ll.add("third")
      @ll.add("fourth")
    end
    it('should return true if the element exists') do
      @ll.contains?("first").should eq(true);
      @ll.contains?("second").should eq(true);
      @ll.contains?("third").should eq(true);
      @ll.contains?("fourth").should eq(true);

    end
    it('should return true if the element DNE') do
      @ll.contains?("fifth").should eq(false)
    end
  end




end
