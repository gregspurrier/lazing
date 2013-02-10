require 'singleton'

module Lazing
  class Stream
    include Enumerable

    def initialize(head, &tail_proc)
      @head = head
      @tail_proc = tail_proc
    end

    def empty?
      false
    end

    def head
      @head
    end

    def tail
      @tail_proc.call
    end

    def mapping(&blk)
      Stream.new(blk.call(head)) do
        t = tail
        if !t.empty?
          t.mapping(&blk)
        else
          t
        end
      end
    end
    alias collecting mapping

    def selecting(&blk)
      if(blk.call(head))
        Stream.new(head) do
          if !tail.empty?
            tail.selecting(&blk)
          else
            tail
          end
        end
      else
        if !tail.empty?
          tail.selecting(&blk)
        else
          tail
        end
      end
    end
    alias finding_all selecting

    def concating_block(&other_block)
      Stream.new(head) do
        tail.concating_block(&other_block)
      end
    end

    def flattening(depth = INFINITE_DEPTH)
      if head.respond_to?(:flattening) and 0 < depth
        head.flattening(depth - 1).concating_block { tail.flattening(depth) }
      else
        Stream.new(head) do
          tail.flattening(depth)
        end
      end
    end

    def each
      stream = self
      loop do
        yield stream.head
        stream = stream.tail
        break if stream.empty?
      end
    end

    def self.from_a(array)
      from_a_internal(array, 0, array.size - 1)
    end

    def self.from_e(enumerable)
      if enumerable.instance_of? Stream
        enumerable
      else
        from_a(enumerable.to_a)
      end
    end

  private

    def self.from_a_internal(array, index, max_index)
      if index <= max_index
        new(array[index]) do
          from_a_internal(array, index + 1, max_index)
        end
      else
        EmptyStream.instance
      end
    end
  end

  class EmptyStream
    include Singleton
    include Enumerable

    def empty?
      true
    end

    def mapping
      []
    end

    def selecting
      []
    end

    def concating_block
      Stream.from_e(yield)
    end

    def flattening(depth = INFINITE_DEPTH)
      []
    end
  end
end
