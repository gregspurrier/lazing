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
    Lazing::Stream.from_e(self).concating(other)
  end

  INFINITE_DEPTH = 1.0/0.0
  def flattening(depth = INFINITE_DEPTH)
    Lazing::Stream.from_e(self).flattening(depth)
  end
end
