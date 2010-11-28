module Enumerable
  def mapping(&blk)
    Lazing::Stream.from_a(self.to_a).mapping(&blk)
  end
  alias collecting mapping

  def rejecting(&blk)
    Lazing::Stream.from_a(self.to_a).rejecting(&blk)
  end


  def selecting(&blk)
    Lazing::Stream.from_a(self.to_a).selecting(&blk)
  end
  alias finding_all selecting 
end
