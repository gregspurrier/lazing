module Enumerable
  def mapping(&blk)
    Lazing::Stream.from_e(self).mapping(&blk)
  end
  alias collecting mapping

  def rejecting(&blk)
    Lazing::Stream.from_e(self).rejecting(&blk)
  end


  def selecting(&blk)
    Lazing::Stream.from_e(self).selecting(&blk)
  end
  alias finding_all selecting

  def concating(other)
    concating_block {other}
  end

  def concating_block(&other_block)
    Lazing::Stream.from_e(self).concating_block(&other_block)
  end

  INFINITE_DEPTH = 1.0/0.0
  def flattening(depth = INFINITE_DEPTH)
    Lazing::Stream.from_e(self).flattening(depth)
  end
end
