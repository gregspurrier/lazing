require File.expand_path('../../spec_helper', __FILE__)

describe Enumerable, '#finding_all' do
  it 'returns a lazy collection matching the results of Enumerable#find_all' do
    range = (1..20)
    range.finding_all {|x| x.odd?}.to_a.should == range.find_all {|x| x.odd?}
  end

  it 'processes items on demand' do
    (1..20).finding_all {|x| raise 'boom' if x == 6; x.odd?}.first(3).
        should == [1,3,5]
  end
end

describe Enumerable, '#rejecting' do
  it 'returns a lazy collection matching the results of Enumerable#reject' do
    range = (1..20)
    range.rejecting {|x| x.odd?}.to_a.should == range.reject {|x| x.odd?}
  end

  it 'processes items on demand' do
    (1..20).rejecting {|x| raise 'boom' if x == 6; x.even?}.first(3).
        should == [1,3,5]
  end
end

describe Enumerable, '#selecting' do
  it 'returns a lazy collection matching the results of Enumerable#select' do
    range = (1..20)
    range.selecting {|x| x.odd?}.to_a.should == range.select {|x| x.odd?}
  end

  it 'processes items on demand' do
    (1..20).selecting {|x| raise 'boom' if x == 6; x.odd?}.first(3).
        should == [1,3,5]
  end
end
