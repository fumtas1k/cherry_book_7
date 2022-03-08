require_relative "juice"

class Juice
  def inspect = name

  def eql?(other)
    other.instance_of?(Juice) && name.eql?(other.name)
  end

  def hash = name.hash
end
