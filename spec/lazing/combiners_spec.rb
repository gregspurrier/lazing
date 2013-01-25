require File.expand_path('../../spec_helper', __FILE__)

describe Enumerator, "#concating" do

  it "returns the same collection as concat" do
    as = [1,2,3]
    bs = [4,5,6]
    (as.concating bs).to_a.should == as.concat(bs)
  end

  it "processes items on demand" do
    as = Enumerator.new (1..2)
    bs = [3,4].mapping {|i| raise 'boom' if i == 4; i}
    (as.concating bs).first(3).should == [1,2,3]
  end
end

describe Enumerator, '#flattening' do

  it "returns the same collection as flatten" do
    tree = [[1], [1,2], [1,2,3]]
    tree.flattening.to_a.should == [1, 1,2, 1,2,3]
  end

  it "processes items on demand" do
    processed_items = 0
    enums = (1..3).mapping {|i| (1..i).mapping {|j| processed_items += 1; j}}

    enums.flattening.first(3).should == [1, 1,2]
    processed_items.should == 3
  end

end
