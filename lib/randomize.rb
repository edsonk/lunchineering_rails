module Randomize
  def randomize(limit)
    order('random()').limit(limit)
  end
end
