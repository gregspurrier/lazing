require File.expand_path('../../spec_helper', __FILE__)

[:collecting, :mapping,].each do |transformation|

  describe Enumerable, "##{transformation}" do
    it 'returns a lazy collection matching the results of Enumerable#map' do
      range = (1..20)
      range.send(transformation) {|x| x * x}.to_a.should == range.map {|x| x * x}
    end

    it 'processes items on demand' do
      (1..20).send(transformation) {|x| raise 'boom' if x == 4; x * x}.first(3).
        should == [1,4,9]
    end

    it 'allows nils in the stream' do
      [1,2,3,nil,9,10].send(transformation) {|x| x}.to_a.should == [1,2,3,nil,9,10]
    end

    it "works with multi arguments blocks" do
      range = [:a, :b, :c]
      expected = range.each_with_index.map {|letter,index| [letter,index]}
      range.each_with_index.send(transformation) {|letter,index| [letter,index]}.to_a.should == expected
    end

    it "leaves the empty array unchanged" do
      [].send(transformation) {|x| x}.to_a.should == []
    end
  end

end
