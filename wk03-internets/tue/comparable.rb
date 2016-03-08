module Comparable
  def <(other_thing)
    (self <=> other_thing) == -1
  end

  def ==(other_thing)
    (self <=> other_thing) == 0
  end

  def >(other_thing)
    (self <=> other_thing) == 1
  end
end
