module Enumerable
  def concating(other)
    Enumerator.new do |yielder|
      each do |item|
        yielder.yield item
      end
      other.each do |item|
        yielder.yield item
      end
    end
  end

  def flattening(depth = Float::INFINITY)
    Enumerator.new do |yielder|
      stack = [self.each]
      while !stack.empty?
        node = stack.last
        begin
          child = node.next
          if stack.size <= depth and child.respond_to? :each
            stack.push child.each
          else
            yielder.yield child
          end
        rescue StopIteration
          stack.pop
        end
      end
    end
  end
end
