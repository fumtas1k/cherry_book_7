require_relative "juice"

class Juice
  def to_s
    name
  end

  def eql?(other)
    other.instance_of?(Juice) && name.eql?(other.name)
  end

  def hash
    name.hash
  end
end

def greet
  puts "こんにちは"
end
