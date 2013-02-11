module Enumerable
  # Lazy version of Enumerable#map
  #
  # Returns the lazy collection formed by applying the given block to each
  # member of the collection.
  def mapping(&blk)
    Enumerator.new do |yielder|
      each do |*items|
        yielder.yield blk.call(*items)
      end
    end
  end

  # Lazy version of Enumerable#collect
  #
  # Returns the lazy collection formed by applying the given block to each
  # member of the collection.
  alias collecting mapping
end
