require File.expand_path('../../spec_helper', __FILE__)

describe Enumerable, '#collecting' do
  it 'returns a lazy collection matching the results of Enumerable#collect' do
    range = (1..20)
    range.collecting {|x| x * x}.to_a.should == range.collect {|x| x * x}
  end

  it 'processes items on demand' do
    (1..20).collecting {|x| raise 'boom' if x == 4; x * x}.first(3).
        should == [1,4,9]
  end

  it 'allows nils in the stream' do
    [1,2,3,nil,9,10].collecting {|x| x}.to_a.should == [1,2,3,nil,9,10]
  end
end

describe Enumerable, '#mapping' do
  it 'returns a lazy collection matching the results of Enumerable#map' do
    range = (1..20)
    range.mapping {|x| x * x}.to_a.should == range.map {|x| x * x}
  end

  it 'processes items on demand' do
    (1..20).mapping {|x| raise 'boom' if x == 4; x * x}.first(3).
        should == [1,4,9]
  end

  it 'allows nils in the stream' do
    [1,2,3,nil,9,10].mapping {|x| x}.to_a.should == [1,2,3,nil,9,10]
  end
end
