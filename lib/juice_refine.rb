require_relative "juice"

class Juice
  def inspect = name

  def eql?(other)
    other.instance_of?(Juice) && name.eql?(other.name)
  end

  def hash = name.hash

  def <=>(other)
    if other.instance_of?(Juice)
      self.name <=> other.name
    end
  end
end
