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


    def rejecting(&blk)
      selecting {|item| !blk.call(item)}
    end

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

    def empty?
      true
    end
  end
end
