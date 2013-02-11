module Enumerable
  # Lazy version of Enumerable#reject.
  #
  # Returns a lazy collection containing all elements of the collection
  # for which the provided block returns false.
  def rejecting(&blk)
    Enumerator.new do |yielder|
      each do |*item|
        yielder.yield *item unless blk.call(*item)
      end
    end
  end

  # Lazy version of Enumerable#select
  #
  # Returns a lazy collection containing all elements of the collection
  # for which the provided block returns true.
  def selecting(&blk)
    Enumerator.new do |yielder|
      each do |*item|
        yielder.yield *item if blk.call(*item)
      end
    end
  end

  # Lazy version of Enumerable#find_all
  #
  # Returns a lazy collection containing all elements of the collection
  # for which the provided block returns true.
  alias finding_all selecting
end
