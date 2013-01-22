class Enumerator
  def concatenating(other)
    Enumerator.new do |yielder|
      each do |item|
        yielder.yield item
      end
      other.each do |item|
        yielder.yield item
      end
    end
  end

  def flattening
    Enumerator.new do |yielder|
      each do |sub_enum|
        sub_enum.each do |item|
          yielder.yield item
        end
      end
    end
  end
end
